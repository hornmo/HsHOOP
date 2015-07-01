<?php
class Dimensions{
	private $length;
	private $width;
	private $height;
	private $track_front;
	private $track_rear;
	private $track_mean;
	private $wheelbase;
	private $contact_area;
	private $dimensions_total;
	
	public function getByID($id){
		$dim = DatabaseHandler::getConnected("dimensions", $id);
		$dim = $dim[0];
		if(is_object($dim)){
			return $dim;
		}
	}
		
	public function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["length"=>$this->length]);
		$retVal = array_merge($retVal, ["width"=>$this->width]);
		$retVal = array_merge($retVal, ["height"=>$this->height]);
		$retVal = array_merge($retVal, ["track_front"=>$this->track_front]);
		$retVal = array_merge($retVal, ["track_rear"=>$this->track_rear]);
		$retVal = array_merge($retVal, ["track_mean"=>$this->track_mean]);
		$retVal = array_merge($retVal, ["wheelbase"=>$this->wheelbase]);
		$retVal = array_merge($retVal, ["contact_area"=>$this->contact_area]);
		return $retVal;
	}
}
?>