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
	
	public function getByID($id){
		$we = DatabaseHandler::getConnected("weights", $id);
		$we = $we[0];
		return $we;
	}
	
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