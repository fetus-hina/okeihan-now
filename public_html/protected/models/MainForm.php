<?php
class MainForm extends CFormModel {
    public $carNumber, $trainNumber, $type, $terminal, $formDetail;

    public function rules() {
        return array(
            array('carNumber, type, terminal, formDetail', 'required'),
            array('carNumber',      'exist', 'attributeName' => 'number', 'className' => 'Car'),
            array('type',           'exist', 'attributeName' => 'id', 'className' => 'Type'),
            array('terminal',       'exist', 'attributeName' => 'id', 'className' => 'Station'),
            array('formDetail',     'boolean'),
        );
    }

    public function attributeLabels() {
        return array(
            'carNumber'     => '車両番号',
            'trainNumer'    => '列車番号',
            'type'          => '種別',
            'terminal'      => '行き先',
            'formDetail'    => '編成詳細',
        );
	}
}
