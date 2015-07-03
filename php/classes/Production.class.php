<?php
class Production {
	private $process_stability;
	private $re_use_factor;
	private $mechanisation;
	private $no_prod_sites;
	private $prod_sites;
	private $intended_production_vol;
	private $production_lead_time;
	private $cycle_time;
	private $mat_util_degree;
	private $no_parts;
	
	// Gibt ein Objekt der Klasse für die gegebene Karosserie-ID zurück
	
	public static function getByID($id){
		$dim = DatabaseHandler::getConnected("production", $id);
		return $dim;
	}
	
	// Gibt die Attribute der Klasse als Array zurück
	
	public function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["process_stability"=>$this->process_stability]);
		$retVal = array_merge($retVal, ["re_use_factor"=>$this->re_use_factor]);
		$retVal = array_merge($retVal, ["mechanisation"=>$this->mechanisation]);
		$retVal = array_merge($retVal, ["no_prod_sites"=>$this->no_prod_sites]);
		$retVal = array_merge($retVal, ["prod_sites"=>$this->prod_sites]);
		$retVal = array_merge($retVal, ["intended_production_vol"=>$this->intended_production_vol]);
		$retVal = array_merge($retVal, ["production_lead_time"=>$this->production_lead_time]);
		$retVal = array_merge($retVal, ["cycle_time"=>$this->cycle_time]);
		$retVal = array_merge($retVal, ["mat_util_degree"=>$this->mat_util_degree]);
		$retVal = array_merge($retVal, ["no_parts"=>$this->no_parts]);
		return $retVal;
	}
}
?>
