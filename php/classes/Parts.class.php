<?php
class Parts{
	private $no_parts;
	private $parts100g;
	private $parts1kg;
	private $parts5kg;
	private $parts_more5kg;
	
	// Gibt ein Objekt der Klasse für die gegebene Karosserie-ID zurück
	
	public static function getByID($id){
		$par = DatabaseHandler::getConnected("parts", "Parts", $id);
		return $par;
	}
	
	// Gibt die Attribute der Klasse als Array zurück
	
	public function getValues() { 
		$retVal = array();
		$retVal = array_merge($retVal, ["no_parts"=>$this->no_parts]);
		$retVal = array_merge($retVal, ["parts100g"=>$this->parts100g]);
		$retVal = array_merge($retVal, ["parts1kg"=>$this->parts1kg]);
		$retVal = array_merge($retVal, ["parts5kg"=>$this->parts5kg]);
		$retVal = array_merge($retVal, ["parts_more5kg"=>$this->parts_more5kg]);
		return $retVal;
	}
}
?>