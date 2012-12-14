<?php

/**
 * This is the model class for table "types".
 *
 * The followings are the available columns in table 'types':
 * @property integer $id
 * @property string $name
 * @property string $name_disp
 * @property string $name_ui
 * @property boolean $is_special
 */
class Type extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Type the static model class
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
		return 'types';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, name, name_disp, name_ui, is_special', 'required'),
			array('id', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, name_disp, name_ui, is_special', 'safe', 'on'=>'search'),
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
			'dias' => array(self::HAS_MANY, 'Dia', 'type_id'),
		);
	}

    public function defaultScope() {
        $self = $this->getTableAlias(false, false);
        return array(
            'order' => "{$self}.is_special ASC, {$self}.id ASC",
        );
    }

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Id',
			'name' => 'Name',
			'name_disp' => 'Name Disp',
			'name_ui' => 'Name Ui',
			'is_special' => 'Is Special',
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

		$criteria->compare('name_disp',$this->name_disp,true);

		$criteria->compare('name_ui',$this->name_ui,true);

		$criteria->compare('is_special',$this->is_special);

		return new CActiveDataProvider('Type', array(
			'criteria'=>$criteria,
		));
	}
}
