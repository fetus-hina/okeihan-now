<?php
class TrainController extends Controller {
    public function actionIndex() {
        $input = array(
            'dia' => isset($_GET['dia']) ? $_GET['dia'] : null,
            'car_number'    => null,
            'train_number'  => null,
            'type'          => null,
            'terminal'      => null,
            'form_detail'   => null,
        );
        if($input['dia'] && ($dia = Dia::model()->findByPk($input['dia']))) {
            $input['train_number']  = $dia->number;
            $input['type']          = $dia->type->id;
            $input['terminal']      = $dia->terminal->id;
        }
        return $this->displayMain($input, array());
	}

    public function actionStations() {
		$this->render(
            'stations',
            array(
                'lines' => Line::model()->findAll(),
            )
        );
    }

    public function actionStation() {
        $input = array(
            'id'    => isset($_GET['id']) ? $_GET['id'] : null,
            'line'  => isset($_GET['line']) ? $_GET['line'] : null,
            'day'   => isset($_GET['day']) ? $_GET['day'] : null,
        );

        if(!$station = Station::model()->findByPk($input['id'])) {
            throw new CHttpException(404, 'The specified station cannot be found.');
        }

        $now = time();

        if($input['day'] !== 'weekday' && $input['day'] !== 'holiday') {
            //TODO: 祝日考慮
            $business_day_t = mktime(date('H', $now) - 4, date('i', $now), date('s', $now), date('n', $now), date('j', $now), date('Y', $now));
            switch(date('w', $business_day_t)) {
            case 0: case 6: $input['day'] = 'holiday'; break;
            default:        $input['day'] = 'weekday'; break;
            }
            $this->redirect($this->createUrl('train/station', $input));
            return;
        }

        $time_from = date('Y-m-d H:i:00', $now - 8 * 60);
        $time_to   = date('Y-m-d H:i:00', $now + 16 * 60 - 1);

        $lines = array();
        foreach($station->lines as $line) {
            $tmp = array(
                'info'   => $line,
                'nobori' => array(),
                'kudari' => array(),
            );
            foreach(array('nobori' => true, 'kudari' => false) as $tmpkey => $is_nobori) {
                $times =
                    Time::model()
                        ->station($station->id)
                        ->line($line->id, $is_nobori)
                        ->timeBetween($time_from, $time_to)
                        ->weekday($input['day'] !== 'holiday')
                        ->findAll();
                if($times) {
                    $tmp[$tmpkey] = $times;
                }
            }
            if($tmp['nobori'] || $tmp['kudari']) {
                $lines[] = (object)$tmp;
            }
        }

		$this->render(
            'station',
            array(
                'input' => $input,
                'station' => $station,
                'lines' => $lines,
            )
        );
    }

    public function actionStationNear() {
        $input = array(
            'error' => isset($_GET['error']) ? $_GET['error'] : null,
            'lat'  => isset($_GET['lat'])  ? $_GET['lat']  : null,
            'long' => isset($_GET['long']) ? $_GET['long'] : null,
        );
        if($input['error']) {
            $stations = array();
        } elseif(!is_numeric($input['lat']) || !is_numeric($input['long'])) {
            throw new CHttpException(400, 'Bad request');
        } else {
            $stations = Station::model()->byLocation($input['lat'], $input['long'])->findAll();
        }
        $this->render(
            'stationNear',
            array(
                'input' => $input,
                'stations' => $stations,
            )
        );
    }

    public function actionStationDia() {
        $input = array(
            'id'    => isset($_GET['id'])   ? $_GET['id']   : null,
            'line'  => isset($_GET['line']) ? $_GET['line'] : null,
            'day'   => isset($_GET['day'])  ? $_GET['day']  : null,
        );

        if(!$station = Station::model()->findByPk($input['id'])) {
            throw new CHttpException(404, 'The specified station cannot be found.');
        }
        $now = time();
        if($input['day'] !== 'weekday' && $input['day'] !== 'holiday') {
            //TODO: 祝日考慮
            $business_day_t = mktime(date('H', $now) - 4, date('i', $now), date('s', $now), date('n', $now), date('j', $now), date('Y', $now));
            switch(date('w', $business_day_t)) {
            case 0: case 6: $input['day'] = 'holiday'; break;
            default:        $input['day'] = 'weekday'; break;
            }
            $this->redirect($this->createUrl('train/stationDia', $input));
            return;
        }

        $lines = array();
        foreach($station->lines as $line) {
            $tmp = array(
                'nobori' => false,
                'kudari' => false,
            );
            foreach(array('nobori' => true, 'kudari' => false) as $tmpkey => $is_nobori) {
                $times =
                    Time::model()
                        ->station($station->id)
                        ->line($line->id, $is_nobori)
                        ->weekday($input['day'] !== 'holiday')
                        ->count();
                if($times > 0) {
                    $tmp[$tmpkey] = true;
                }
            }

            if($tmp['nobori'] || $tmp['kudari']) {
                $lines[] = $line;
            }
        }

        if(!$input['line']) {
            if(count($lines) === 1) {
                $input['line'] = $lines[0]->id;
                $this->redirect($this->createUrl('train/stationDia', $input));
                return;
            }
            $this->render(
                'stationDiaLines',
                array(
                    'input' => $input,
                    'station' => $station,
                    'lines' => $lines,
                )
            );
            return;
        }

        if(!$line = Line::model()->findByPk($input['line'])) {
            throw new CHttpException(400, 'Bad request');
        }
        $nobori = Time::model()->station($station->id)->line($line->id,  true)->weekday($input['day'] !== 'holiday')->findAll();
        $kudari = Time::model()->station($station->id)->line($line->id, false)->weekday($input['day'] !== 'holiday')->findAll();
        if(!$nobori && !$kudari) {
            throw new CHttpException(400, 'Bad request');
        }
		$this->render(
            'stationDia',
            array(
                'input' => $input,
                'station' => $station,
                'line' => $line,
                'lines' => count($lines),
                'nobori' => $nobori,
                'kudari' => $kudari,
            )
        );
    }

    public function actionTrainDia() {
        $input = array(
            'id' => isset($_GET['id']) ? $_GET['id'] : null,
        );
        if(!$dia = Dia::model()->findByPk($input['id'])) {
            throw new CHttpException(404, 'The specified dia cannot be found.');
        }

		$this->render(
            'trainDia',
            array(
                'dia' => $dia,
            )
        );
    }

    function actionTweet() {
        $input = array(
            'car_number'    => isset($_GET['car_number'])   ? $_GET['car_number']   : null,
            'train_number'  => isset($_GET['train_number']) ? $_GET['train_number'] : null,
            'type'          => isset($_GET['type'])         ? $_GET['type']         : null,
            'terminal'      => isset($_GET['terminal'])     ? $_GET['terminal']     : null,
            'form_detail'   => isset($_GET['form_detail'])  ? $_GET['form_detail']  : null,
        );
        $form = new MainForm();
        $form->carNumber    = $input['car_number'];
        $form->trainNumber  = $input['train_number'];
        $form->type         = $input['type'];
        $form->terminal     = $input['terminal'];
        $form->formDetail   = $input['form_detail'] == 'on';
        if(!$form->validate()) {
            return $this->displayMain($input, $form->getErrors());
        }

        $parts = array();

        if($input['train_number'] &&
           ($dia = Dia::model()->findByAttributes(array('number' => $input['train_number']))))
        {
            // 京阪は種別と行き先が列車番号から自明になる仕組みなので
            // 平日・休日ダイヤを考慮せずに検索してもその二つに限れば正しく取得できるはず

            // 種別
            $parts[] = $dia->type->name_disp;

            // 行き先
            $parts[] = $dia->terminal->name . '行き';

            // 列車番号
            $parts[] = $input['train_number'] . '列車';
        } else {
            // 種別
            if($type = Type::model()->findByPk($input['type'])) {
                $parts[] = $type->name_disp;
            }

            // 行き先
            if($station = Station::model()->findByPk($input['terminal'])) {
                $parts[] = $station->name . '行き';
            }

            if($input['train_number']) {
                // 列車番号
                $parts[] = $input['train_number'] . '列車';
            }
        }

        // 編成
        if($car = Car::model()->findByPk($input['car_number'])) {
            if($formation = $car->formation) {
                if($formation->nickname !== null) {
                    $parts[] = '“' . $formation->nickname . '”';
                } elseif($formation->series->nickname !== null) {
                    $parts[] = '“' . $formation->series->nickname . '”';
                }
                $parts[] = $formation->name;

                if($input['form_detail'] == 'on' && $formation->series->id !== 1) { // 鋼索線は書く意味がないので除外
                    $tmp = array();
                    foreach($formation->cars as $tmpcar) {
                        if($tmpcar->number == $car->number) {
                            $tmp[] = '[' . $tmpcar->number . ']';
                        } else {
                            $tmp[] = $tmpcar->number;
                        }
                    }
                    $parts[] = '(' . implode('-', $tmp) . ')';
                }
            }
        }

        // ハッシュタグ
        $parts[] = '#TrainNow';
        $parts[] = '#乗車中';
        $parts[] = '#おけいはんなう';

        $text = implode(' ', $parts);
        $myurl = $this->createAbsoluteUrl('train/index', array(), 'http');
        $url = 'https://twitter.com/intent/tweet?' . http_build_query(array('text' => $text, 'url' => $myurl), '', '&');
        $this->redirect($url);
    }

    private function displayMain($input, $errors = array()) {
        $terminals = array();
        foreach(Station::findAllTerminals() as $terminal) {
            if(!isset($terminals[$terminal['station_id']])) {
                $terminals[$terminal['station_id']] = $terminal;
            }
        }
		$this->render(
            'index',
            array(
                'types' => Type::model()->findAll(),
                'terminals' => $terminals,
                'lines' => Line::model()->findAll(),
                'input' => $input,
                'errors' => $errors,
            )
        );
    }
}
