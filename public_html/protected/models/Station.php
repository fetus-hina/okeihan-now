<?php

/**
 * This is the model class for table "stations".
 *
 * The followings are the available columns in table 'stations':
 * @property integer $id
 * @property string $name
 * @property string $location
 */
class Station extends CActiveRecord
{
    public $distance = null;

	/**
	 * Returns the static model of the specified AR class.
	 * @return Station the static model class
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
		return 'stations';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, name, location', 'required'),
			array('id', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, location', 'safe', 'on'=>'search'),
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
            'lines' => array(self::MANY_MANY, 'Line', 'lines_stations(station_id, line_id)'),
		);
	}

    public function defaultScope() {
        return array();
    }

    public function scopes() {
        $self = $this->getTableAlias(false, false);
        return array(
            'principalOrder' => array('order' => "{$self}.is_principal DESC, {$self}.id ASC"),
        );
    }

    public function byLocation($lat, $long, $limit = 2000) {
        $self = $this->getTableAlias(false, false);
        $func = "distance({$self}.location, POINT(:latitude, :longitude))";
        $this->getDbCriteria()->mergeWith(array(
            'select'    => array('*', 'distance' => $func),
            'condition' => "{$func} <= :distance_limit",
            'params'    => array(':latitude' => (float)$lat, ':longitude' => (float)$long, ':distance_limit' => $limit),
            'order'     => "{$func} ASC",
        ));
        return $this;
    }

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Id',
			'name' => 'Name',
			'location' => 'Location',
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

		$criteria->compare('id',$this->id);

		$criteria->compare('name',$this->name,true);

		$criteria->compare('location',$this->location,true);

		return new CActiveDataProvider('Station', array(
			'criteria'=>$criteria,
		));
	}

    //FIXME
    static public function findAllTerminals() {
        $sql =
            "SELECT line_group.id AS group_id, MAX(line_group.name) AS group_name, stations.id AS station_id, MAX(stations.name) AS station_name " .
            "FROM stations " .
            "JOIN dias ON stations.id = dias.terminal_station_id " .
            "JOIN dias_line_groups ON dias.id = dias_line_groups.dia_id " .
            "JOIN line_group ON dias_line_groups.group_id = line_group.id " .
            "JOIN lines ON line_group.id = lines.group_id " .
            "JOIN lines_stations ON lines.id = lines_stations.line_id AND stations.id = lines_stations.station_id " .
            "GROUP BY line_group.id, stations.id " .
            "ORDER BY line_group.id ASC, (COUNT(*) < 10) ASC, MAX(lines_stations.sort) ASC";
        $command = Yii::app()->db->createCommand($sql);
        return $command->queryAll();
    }
}
