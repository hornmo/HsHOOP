<?php

include_once("Dimensions.class.php");
include_once("Stiffness.class.php");
include_once("MaterialMix.class.php");
include_once("JoiningProcess.class.php");
include_once("ProductionData.class.php");
include_once("DatabaseHandler.class.php");
include_once("User.class.php");

class CarBody {
	private $manufacturer;
	private $name;
	private $modelYear;
	private $id;
	private $dimensions;
	private $stiffness;
	private $materialMix; 
	private $joiningProcess;
	private $productionData;
	
	static public function test($return){
		return $return;
	}
	public static function suche($m, $n, $y){
		$subClasses = array('lengths', 'weights', 'material_mix', 'production', 'parts');
		$model = DatabaseHandler::getBodies($m, $n, $y);
		$id = $model[0]['id_model'];
		foreach($subClasses AS $s){
			$model[] = DatabaseHandler::getConnected($s, $id);
		}
		return $model;
	}
	public static function sucheNachParameter(...$parameters) {
		
		
		$subClasses = array('lengths', 'weights', 'material_mix', 'production');
		$bodies = DatabaseHandler::getBodies($parameters[0], $parameters[1], $parameters[2]);
		return $bodies;
	}
	public function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["manufacturer"=>$this->manufacturer]);
		$retVal = array_merge($retVal, ["name"=>$this->name]);
		$retVal = array_merge($retVal, ["modelYear"=>$this->modelYear]);
		$retVal = array_merge($retVal, $this->dimensions->getValues());
		$retVal = array_merge($retVal, $this->stiffness->getValues());
		$retVal = array_merge($retVal, $this->materialMix->getValues());
		$retVal = array_merge($retVal, $this->joiningProcess->getValues());
		$retVal = array_merge($retVal, $this->productionData->getValues());
		return $retVal;
		}
	} 
?>