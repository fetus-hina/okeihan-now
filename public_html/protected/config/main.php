<?php
// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
    'basePath' => dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
    'name' => 'おけいはんなう',
    'language' => 'ja',

    // preloading 'log' component
    'preload'=>array('log'),

    // autoloading model and component classes
    'import'=>array(
        'application.models.*',
        'application.components.*',
    ),

    'modules'=>array(
    ),

    // application components
    'components'=>array(
        'user'=>array(
            'allowAutoLogin' => false,
        ),
        'urlManager'=>array(
            'showScriptName' => false,
            'urlFormat'=>'path',
            'rules'=>array(
                ''                                                  => 'train/index',
                'station'                                           => 'train/stations',
                'station/<id:\d+>/timetable/<day:holiday|weekday>'  => 'train/stationDia',
                'station/<id:\d+>/<day:holiday|weekday>'            => 'train/station',
                'station/<id:\d+>'                                  => 'train/station',
                'station/near'                                      => 'train/stationNear',
                'train/<id:\d+>'                                    => 'train/trainDia',
                'tweet'                                             => 'train/tweet',
                '<controller:\w+>/<action:\w+>'                     => '<controller>/<action>',
            ),
        ),
        'db'=>array(
            'connectionString' => 'pgsql:host=localhost;port=5432;dbname=keihan',
            'username' => 'alice',
            'password' => 'karen',
        ),
        'viewRenderer' => array(
            'class' => 'application.extensions.yiiext.renderers.smarty.ESmartyViewRenderer',
            'fileExtension' => '.tpl',
            'smartyDir' => 'application.vendor.Smarty',
            'config' => array(
                'left_delimiter'  => '{{',
                'right_delimiter' => '}}',
            ),
            'pluginsDir' => 'application.smartyPlugins',
        ),
        'errorHandler'=>array(
            // use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
        'log'=>array(
            'class'=>'CLogRouter',
            'routes'=>array(
                array(
                    'class'=>'CFileLogRoute',
                    'levels'=>'error, warning',
                ),
                // array(
                //     'class'=>'CFileLogRoute',
                //     'levels'=>'trace',
                //     'categories'=>'system.db.*',
                //     'logFile'=>'sql.log',
                // ),
            ),
        ),
    ),

    // application-level parameters that can be accessed
    // using Yii::app()->params['paramName']
    'params'=>array(
        'adminEmail'=>'hina@jp3cki.jp',
    ),
);
