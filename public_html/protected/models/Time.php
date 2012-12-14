<?php

/**
 * This is the model class for table "times".
 *
 * The followings are the available columns in table 'times':
 * @property integer $dia_id
 * @property integer $station_id
 * @property string $arrive_at
 * @property string $departure_at
 * @property integer $departure_line_id
 */
class Time extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Time the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'times';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('dia_id, station_id', 'required'),
			array('dia_id, station_id, departure_line_id', 'numerical', 'integerOnly'=>true),
			array('arrive_at, departure_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('dia_id, station_id, arrive_at, departure_at, departure_line_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
            'dia' => array(self::BELONGS_TO, 'Dia', 'dia_id'),
            'station' => array(self::BELONGS_TO, 'Station', 'station_id'),
		);
	}

    public function defaultScope() {
        $self = $this->getTableAlias(false, false);
        return array(
            'with' => array('dia'),
            'order' => "{$self}.departure_at IS NULL ASC, time2datetime({$self}.departure_at) ASC",
        );
    }

    public function station($station_id) {
        $self = $this->getTableAlias(false, false);
        $this->getDbCriteria()->mergeWith(array(
            'condition' => "{$self}.station_id = :station_id",
            'params' => array(':station_id' => $station_id),
        ));
        return $this;
    }

    public function line($line_id, $is_nobori) {
        $self = $this->getTableAlias(false, false);
        $conds = array(
            "{$self}.departure_line_id = :line_id",
            "is_nobori({$self}.departure_line_id, dia.number) = :is_nobori",
        );
        $this->getDbCriteria()->mergeWith(array(
            'with' => 'dia',
            'condition' => implode(' AND ', $conds),
            'params' => array(':line_id' => $line_id, ':is_nobori' => !!$is_nobori),
        ));
        return $this;
    }

    public function timeBetween($from_string, $to_string) {
        $self = $this->getTableAlias(false, false);
        $this->getDbCriteria()->mergeWith(array(
            'condition' => "{$self}.departure_at BETWEEN :dept_from AND :dept_to",
            'params' => array(':dept_from' => $from_string, ':dept_to' => $to_string),
        ));
        return $this;
    }

    public function weekday($is_weekday = true) {
        $column = $is_weekday ? 'weekday' : 'holiday';
        $this->getDbCriteria()->mergeWith(array(
            'with' => 'dia',
            'condition' => "dia.{$column} = TRUE",
        ));
        return $this;
    }

    public function holiday() {
        return $this->weekday(false);
    }

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'dia_id' => 'Dia',
			'station_id' => 'Station',
			'arrive_at' => 'Arrive At',
			'departure_at' => 'Departure At',
			'departure_line_id' => 'Departure Line',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('dia_id',$this->dia_id);

		$criteria->compare('station_id',$this->station_id);

		$criteria->compare('arrive_at',$this->arrive_at,true);

		$criteria->compare('departure_at',$this->departure_at,true);

		$criteria->compare('departure_line_id',$this->departure_line_id);

		return new CActiveDataProvider('Time', array(
			'criteria'=>$criteria,
		));
	}
}
