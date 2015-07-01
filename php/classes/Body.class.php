<?php

include_once("Dimensions.class.php");
include_once("Stiffness.class.php");
include_once("MaterialMix.class.php");
include_once("JoiningProcess.class.php");
include_once("Production.class.php");
include_once("DatabaseHandler.class.php");
include_once("Weights.class.php");

class CarBody {
	private $manufacturer;
	private $name;
	private $model_year;
	private $id_model;
	private $generation;
	private $internaloem;
	private $segment;
	private $dimensions;
	private $stiffness;
	private $materialMix; 
	private $joiningProcess;
	private $production;
	private $parts;
	private $weights;
	
	public static function suche($m, $n, $y){
		$model = DatabaseHandler::getBodyByPars($m, $n, $y);
		$id = $model[0]->id_model;
		$model[0]->dimensions = Dimensions::getByID($id);
		$model[0]->weights = Weights::getByID($id);
		$model[0]->stiffness = Stiffness::getByID($id);
		return $model;
	}
	public static function showDetails($id){
		$subClasses = array('dimensions', 'weights', 'material_mix', 'production', 'parts');
		$model = DatabaseHandler::getBodyByID($id);
		$m['model'] = $model;
		return $m;
	}
	public static function sucheNachParameter($parameters) {
		
		$bodies = DatabaseHandler::getBodies($parameters);
		return $bodies;
	}
	public static function insertBody($parameters) {
		$insert = DatabaseHandler::insertBody($parameters);
		return $insert;
	}
	public function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["manufacturer"=>$this->manufacturer]);
		$retVal = array_merge($retVal, ["name"=>$this->name]);
		$retVal = array_merge($retVal, ["modelYear"=>$this->model_year]);
		if(is_object($this->dimensions)){
			$retVal = array_merge($retVal, ["dimensions"=>$this->dimensions->getValues()]);
		}
		if(is_object($this->weights)){
			$retVal = array_merge($retVal, ["weights"=>$this->weights->getValues()]);
		}
		if(is_object($this->stiffness)){
			$retVal = array_merge($retVal, ["stiffness"=>$this->stiffness->getValues()]);
		}
		if(is_object($this->materialMix)){
			$retVal = array_merge($retVal, ["materialMix"=>$this->materialMix->getValues()]);
		}
		if(is_object($this->joiningProcess)){
			$retVal = array_merge($retVal, ["joiningProcess"=>$this->joiningProcess->getValues()]);
		}
		if(is_object($this->production)){
			$retVal = array_merge($retVal, ["production"=>$this->production->getValues()]);
		}
		return $retVal;
		}
	} 
?>
