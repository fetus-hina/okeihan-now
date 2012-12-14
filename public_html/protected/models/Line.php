<?php

/**
 * This is the model class for table "lines".
 *
 * The followings are the available columns in table 'lines':
 * @property integer $id
 * @property integer $group_id
 * @property integer $sort
 * @property string $name
 */
class Line extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Line the static model class
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
		return 'lines';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, group_id, sort, name', 'required'),
			array('id, group_id, sort', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, group_id, sort, name', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
        $self = $this->getTableAlias(false, false);
		return array(
			'group' => array(self::BELONGS_TO, 'LineGroup', 'group_id'),
            'stations' => array(
                self::MANY_MANY, 'Station', 'lines_stations(line_id, station_id)',
                'order' => "stations_stations.sort ASC", //FIXME: alias
            ),
            'stations_principal_order' => array(
                self::MANY_MANY, 'Station', 'lines_stations(line_id, station_id)',
                'scopes' => array('principalOrder'),
            ),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Id',
			'group_id' => 'Group',
			'sort' => 'Sort',
			'name' => 'Name',
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

		$criteria->compare('group_id',$this->group_id);

		$criteria->compare('sort',$this->sort);

		$criteria->compare('name',$this->name,true);

		return new CActiveDataProvider('Line', array(
			'criteria'=>$criteria,
		));
	}
}
