<?php
class Dimensions{
	private $length;
	private $width;
	private $height;
	private $track_front;
	private $track_rear;
	private $wheelbase;
	private $contact_area;
	private $weight_biw;
	private $weight_fdoors;
	private $weight_rdoors;
	private $weight_hood;
	private $weight_tailgate;
	private $weight_ffenders;
		
	public static function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["length"=>$this->length]);
		$retVal = array_merge($retVal, ["width"=>$this->width]);
		$retVal = array_merge($retVal, ["height"=>$this->height]);
		$retVal = array_merge($retVal, ["track_front"=>$this->track_front]);
		$retVal = array_merge($retVal, ["track_rear"=>$this->track_rear]);
		$retVal = array_merge($retVal, ["wheelbase"=>$this->wheelbase]);
		$retVal = array_merge($retVal, ["contact_area"=>$this->contact_area]);
		$retVal = array_merge($retVal, ["weight_biw"=>$this->weight_biw]);
		$retVal = array_merge($retVal, ["weight_fdoors"=>$this->weight_fdoors]);
		$retVal = array_merge($retVal, ["weight_rdoors"=>$this->weight_rdoors]);
		$retVal = array_merge($retVal, ["weight_hood"=>$this->weight_hood]);
		$retVal = array_merge($retVal, ["weight_tailgate"=>$this->weight_tailgate]);
		$retVal = array_merge($retVal, ["weight_ffenders"=>$this->weight_ffenders]);
		return $retVal;
	}
}
?>