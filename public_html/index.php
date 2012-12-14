<?php
date_default_timezone_set('Asia/Tokyo');
$yii=dirname(__FILE__).'/../yii/framework/yii.php';
if(true) {
    // production
    $config=dirname(__FILE__).'/protected/config/main.php';
    defined('YII_DEBUG') or define('YII_DEBUG',true);
    defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL',3);
} else {
    // development
    $config=dirname(__FILE__).'/protected/config/test.php';
    defined('YII_DEBUG') or define('YII_DEBUG',true);
}
require_once($yii);
Yii::createWebApplication($config)->run();
