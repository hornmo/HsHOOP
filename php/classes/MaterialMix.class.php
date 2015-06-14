<?php
class MaterialMix{
	private $low_strength_steel;
	private $hss_hsif_hsla;
	private $ahss;
	private $stainless_steel;
	private $uhss;
	private $al;
	private $mg;
	private $frp;
	private $smc;
	private $thermoplastics;
	private $elastomers;
	
	public static function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["low_strength_steel"=>$this->low_strength_steel]);
		$retVal = array_merge($retVal, ["hss_hsif_hsla"=>$this->hss_hsif_hsla]);
		$retVal = array_merge($retVal, ["ahss"=>$this->ahss]);
		$retVal = array_merge($retVal, ["stainless_steel"=>$this->stainless_steel]);
		$retVal = array_merge($retVal, ["uhss"=>$this->uhss]);
		$retVal = array_merge($retVal, ["al"=>$this->al]);
		$retVal = array_merge($retVal, ["mg"=>$this->mg]);
		$retVal = array_merge($retVal, ["frp"=>$this->frp]);
		$retVal = array_merge($retVal, ["smc"=>$this->smc]);
		$retVal = array_merge($retVal, ["thermoplastics"=>$this->thermoplastics]);
		$retVal = array_merge($retVal, ["elastomers"=>$this->elastomers]);
		return $retVal;
	}
}
?>