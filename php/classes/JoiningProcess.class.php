<?php
class JoiningPocess {
	private $spot_welds;
	private $arc_welding;
	private $friction_steel_welding;
	private $laser_welding;
	private $conventional_brazing;
	private $laser_brazing;
	private $adhesive_joining;
	private $rivets;
	private $clinch_spots;

	public static function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["spot_welds"=>$this->spot_welds]);
		$retVal = array_merge($retVal, ["arc_welding"=>$this->arc_welding]);
		$retVal = array_merge($retVal, ["friction_steel_welding"=>$this->friction_steel_welding]);
		$retVal = array_merge($retVal, ["laser_welding"=>$this->laser_welding]);
		$retVal = array_merge($retVal, ["conventional_brazing"=>$this->conventional_brazing]);
		$retVal = array_merge($retVal, ["laser_brazing"=>$this->laser_brazing]);
		$retVal = array_merge($retVal, ["adhesive_joining"=>$this->adhesive_joining]);
		$retVal = array_merge($retVal, ["rivets"=>$this->rivets]);
		$retVal = array_merge($retVal, ["clinch_spots"=>$this->clinch_spots]);
		return $retVal;
	}
}
?>