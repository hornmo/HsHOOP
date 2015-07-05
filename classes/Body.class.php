<?php

// Klassen für Karosseriedetails

include_once("Dimensions.class.php");
include_once("Stiffness.class.php");
include_once("MaterialMix.class.php");
include_once("JoiningProcess.class.php");
include_once("Production.class.php");
include_once("Weights.class.php");
include_once("Parts.class.php");

// Verwendete Klasse für Datenbankabfragen
include_once("DatabaseHandler.class.php");

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
	
	// Suche Karosserie nach Hersteller, Name, Jahr (nicht optimal, da Duplikate nicht vermneidbar! -> benutze showDetails() ) 
	
	public static function suche($m, $n, $y){
		$model = DatabaseHandler::getBodyByPars($m, $n, $y);
		if(is_object($model[0])){
			$model = $model[0];
			$id = $model->id_model;
			return $model;
		}
	}
	
	// Gibt Objekt zurück mit allen Details
	
	public static function showDetails($id){
		$model = DatabaseHandler::getBodyByID($id);
		$model->dimensions = Dimensions::getByID($id);
		$model->weights = Weights::getByID($id);
		$model->stiffness = Stiffness::getByID($id);
		$model->materialMix = MaterialMix::getByID($id);
		$model->joiningProcess = JoiningProcess::getByID($id);
		$model->production = Production::getByID($id);
		$model->parts = Parts::getByID($id);
		if(is_object($model)){
			return $model;
		}
	}
	
	// Suche nach beliebig vielen verknüpften Kriterien -> Gibt ein Array von Objekten zurück
	
	public static function sucheNachParameter($parameters) {
		
		$bodies = DatabaseHandler::getBodies($parameters);
		if(is_object($bodies[0])){
			return $bodies;
		}else{
			return 'Leere Ergebnismenge für gegebene Parameter';
		}
	}
	
	// Gibt ein CarBody-Objekt als Array zurück
	
	public function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["model"=>[]]);
		$retVal['model']['manufacturer'] = $this->manufacturer;
		$retVal['model']['name'] = $this->name;
		$retVal['model']['model_year'] = $this->model_year;
		$retVal['model']['generation'] = $this->generation;
		$retVal['model']['id_model'] = $this->id_model;
		$retVal['model']['internaloem'] = $this->internaloem;
		$retVal['model']["segment"] = $this->segment;
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
		if(is_object($this->parts)){
			$retVal = array_merge($retVal, ["parts"=>$this->parts->getValues()]);
		}
		return $retVal;
		}
	}
?>
