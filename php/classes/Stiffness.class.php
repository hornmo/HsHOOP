<?php
class Stiffness{
	private $first_resfreq_trimmed;
	private $second_resfreq_trimmed;
	private $first_resfreq_body;
	private $second_resfreq_body;
	private $static_tors_stiff;
	private $static_bend_stiff;
	
	// Gibt ein Objekt der Klasse für die gegebene Karosserie-ID zurück	

	public static function getByID($id){
		$sti = DatabaseHandler::getConnected("stiffness", $id);
		return $sti;
	}
	
	// Gibt die Attribute der Klasse als Array zurück
	
	public function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["first_resfreq_trimmed"=>$this->first_resfreq_trimmed]);
		$retVal = array_merge($retVal, ["second_resfreq_trimmed"=>$this->second_refreq_trimmed]);
		$retVal = array_merge($retVal, ["first_resfreq_body"=>$this->first_resfreq_body]);
		$retVal = array_merge($retVal, ["second_resfreq_body"=>$this->second_resfreq_body]);
		$retVal = array_merge($retVal, ["static_tors_stiff"=>$this->static_tors_stiff]);
		$retVal = array_merge($retVal, ["static_bend_stiff"=>$this->static_bend_stiff]);
		return $retVal;
	}
}
?>