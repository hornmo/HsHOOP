<?php
class Production {
	private $up_time;
	private $reuse_factor;
	private $mechanisation;
	private $no_prod_sites;
	private $prod_sites;
	private $intended_volume;
	private $lead_time;
	private $cycle_time;
	private $mat_util_degree;
	private $no_parts;
	
	public function getByID($id){
		$dim = DatabaseHandler::getConnected("dimensions", $id);
		$dim = $dim[0];
		return $dim;
	}
	
	public static function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["up_time"=>$this->up_time]);
		$retVal = array_merge($retVal, ["reuse_factor"=>$this->reuse_factor]);
		$retVal = array_merge($retVal, ["mechanisation"=>$this->mechanisation]);
		$retVal = array_merge($retVal, ["no_prod_sites"=>$this->no_prod_sites]);
		$retVal = array_merge($retVal, ["prod_sites"=>$this->prod_sites]);
		$retVal = array_merge($retVal, ["intended_volume"=>$this->intended_volume]);
		$retVal = array_merge($retVal, ["lead_time"=>$this->lead_time]);
		$retVal = array_merge($retVal, ["cycle_time"=>$this->cycle_time]);
		$retVal = array_merge($retVal, ["mat_util_degree"=>$this->mat_util_degree]);
		$retVal = array_merge($retVal, ["no_parts"=>$this->no_parts]);
		return $retVal;
	}
}
?>
