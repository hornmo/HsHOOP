<?php
class Weights{
	private $biw;
	private $front_doors;
	private $rear_doors;
	private $hood;
	private $tailgate;
	private $front_fenders;
	private $hinges;
	private $fuelflap;
	private $frontend;
	private $weight_total;
	
	// Gibt ein Objekt der Klasse für die gegebene Karosserie-ID zurück
	
	public static function getByID($id){
		$we = DatabaseHandler::getConnected("weights", "Weights", $id);
		return $we;
	}
	
	// Gibt die Attribute der Klasse als Array zurück
	
	public function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["biw"=>$this->biw]);
		$retVal = array_merge($retVal, ["front_doors"=>$this->front_doors]);
		$retVal = array_merge($retVal, ["rear_doors"=>$this->rear_doors]);
		$retVal = array_merge($retVal, ["hood"=>$this->hood]);
		$retVal = array_merge($retVal, ["tailgate"=>$this->tailgate]);
		$retVal = array_merge($retVal, ["front_fenders"=>$this->front_fenders]);
		$retVal = array_merge($retVal, ["hinges"=>$this->hinges]);
		$retVal = array_merge($retVal, ["fuelflap"=>$this->fuelflap]);
		$retVal = array_merge($retVal, ["frontend"=>$this->frontend]);
		$retVal = array_merge($retVal, ["weight_total"=>$this->weight_total]);
		return $retVal;
	}
}
?>