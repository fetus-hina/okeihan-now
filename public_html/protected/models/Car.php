<?php

/**
 * This is the model class for table "cars".
 *
 * The followings are the available columns in table 'cars':
 * @property integer $number
 * @property integer $formation_id
 * @property integer $position
 */
class Car extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Car the static model class
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
		return 'cars';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('number, formation_id, position', 'required'),
			array('number, formation_id, position', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('number, formation_id, position', 'safe', 'on'=>'search'),
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
			'formation' => array(self::BELONGS_TO, 'Formation', 'formation_id'),
		);
	}

    public function defaultScope() {
        $self = $this->getTableAlias(false, false);
        return array(
            'order' => "{$self}.formation_id, {$self}.position",
        );
    }

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'number' => 'Number',
			'formation_id' => 'Formation',
			'position' => 'Position',
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

		$criteria->compare('number',$this->number);

		$criteria->compare('formation_id',$this->formation_id);

		$criteria->compare('position',$this->position);

		return new CActiveDataProvider('Car', array(
			'criteria'=>$criteria,
		));
	}
}
