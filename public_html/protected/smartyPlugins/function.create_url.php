<?php
function smarty_function_create_url($params, &$smarty) {
    if(!isset($params['route'])) {
        throw new CException('You should specify route parameter');
    }
    $route = $params['route'];
    $amp = isset($params['amp']) ? $params['amp'] : '&';
    unset($params['route']);
    unset($params['amp']);
    unset($params['schema']);
    unset($params['_back']);
    return Yii::app()->getController()->createUrl($route, $params, $amp);
}
