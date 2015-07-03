<?php
class MaterialMix{
	private $low_strength_steel;
	private $hss_hsif_hsla;
	private $ahss;
	private $stainless_steel;
	private $uhss;
	private $aluminium;
	private $magnesium;
	private $other;
	private $steel;
	private $frp;
	private $smc;
	private $thermoplastics;
	private $elastomers;
	
	// Gibt ein Objekt der Klasse für die gegebene Karosserie-ID zurück
	
	public static function getByID($id){
		$dim = DatabaseHandler::getConnected("material_mix", $id);
		return $dim;
	}
	
	// Gibt die Attribute der Klasse als Array zurück
	
	public function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["low_strength_steel"=>$this->low_strength_steel]);
		$retVal = array_merge($retVal, ["hss_hsif_hsla"=>$this->hss_hsif_hsla]);
		$retVal = array_merge($retVal, ["ahss"=>$this->ahss]);
		$retVal = array_merge($retVal, ["stainless_steel"=>$this->stainless_steel]);
		$retVal = array_merge($retVal, ["steel"=>$this->steel]);
		$retVal = array_merge($retVal, ["uhss"=>$this->uhss]);
		$retVal = array_merge($retVal, ["aluminium"=>$this->aluminium]);
		$retVal = array_merge($retVal, ["magnesium"=>$this->magnesium]);
		$retVal = array_merge($retVal, ["other"=>$this->other]);
		$retVal = array_merge($retVal, ["frp"=>$this->frp]);
		$retVal = array_merge($retVal, ["smc"=>$this->smc]);
		$retVal = array_merge($retVal, ["thermoplastics"=>$this->thermoplastics]);
		$retVal = array_merge($retVal, ["elastomers"=>$this->elastomers]);
		return $retVal;
	}
}
?>