<?php

/**
 * This is the model class for table "holidays".
 *
 * The followings are the available columns in table 'holidays':
 * @property string $date
 */
class Holiday extends CActiveRecord
{
    static public function isHolidayDiaDay($time) {
        $business_day_t = mktime(date('H', $time) - 4, date('i', $time), date('s', $time), date('n', $time), date('j', $time), date('Y', $time));
        $wday = (int)date('w', $business_day_t);
        if($wday === 0 || $wday === 6) {
            return true;
        }
        return self::model()->findByPk(date('Y-m-d', $business_day_t));
    }

	/**
	 * Returns the static model of the specified AR class.
	 * @return Holiday the static model class
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
		return 'holidays';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('date', 'required'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('date', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'date' => 'Date',
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

		$criteria->compare('date',$this->date,true);

		return new CActiveDataProvider('Holiday', array(
			'criteria'=>$criteria,
		));
	}
}
