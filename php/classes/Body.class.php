<?php

include_once("Dimensions.class.php");
include_once("Stiffness.class.php");
include_once("MaterialMix.class.php");
include_once("JoiningProcess.class.php");
include_once("ProductionData.class.php");
include_once("DatabaseHandler.class.php");

class CarBody {
	private $manufacturer;
	private $name;
	private $modelYear;
	private $dimensions;
	private $stiffness;
	private $materialMix; 
	private $joiningProcess;
	private $productionData;
	
	static public function test($return){
		return $return;
	}
	public static function suche($m, $n, $y){
		return new Body;
	}
	public static function sucheNachParameter($name, $year) { 
		$subClasses = array('lengths', 'weights', 'stiffness_data', 'material_mix', 'joining_process', 'production', 'production_sites');
		$bodies = DatabaseHandler::getBodies($name, $year);
		return $bodies;
	} 
	public static function getValues() { 
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