<?php

/**
 * This is the model class for table "formations".
 *
 * The followings are the available columns in table 'formations':
 * @property integer $id
 * @property integer $series_id
 * @property string $name
 * @property string $nickname
 */
class Formation extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Formation the static model class
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
		return 'formations';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, series_id, name', 'required'),
			array('id, series_id', 'numerical', 'integerOnly'=>true),
			array('nickname', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, series_id, name, nickname', 'safe', 'on'=>'search'),
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
			'series' => array(self::BELONGS_TO, 'Series', 'series_id'),
			'cars' => array(self::HAS_MANY, 'Car', 'formation_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Id',
			'series_id' => 'Series',
			'name' => 'Name',
			'nickname' => 'Nickname',
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

		$criteria->compare('series_id',$this->series_id);

		$criteria->compare('name',$this->name,true);

		$criteria->compare('nickname',$this->nickname,true);

		return new CActiveDataProvider('Formation', array(
			'criteria'=>$criteria,
		));
	}
}
