<?php

class DatabaseHandler{
	private $user = "root";
	private $password = "";
	
	static private function createConnection($host, $schema, $user, $password) {
		
		$dbh = new PDO("mysql:host=$host;dbname=$schema;port=3306;charset=utf8", $user, $password);
		return $dbh;
	}
	static public function getBodies($name, $year){
		$dbh = self::createConnection('localhost', 'cars', 'root', '');
		$select = "SELECT * FROM model WHERE ";
		$man = "";
		if($man){
			$select .= "manufacturer LIKE " .$man." ";
		}
		if($name){
			if($man){
				$select .= "AND ";
			}
			$select .="name LIKE ".$name." ";
		}
		if($year){
			if($man && $name){
				$select .= "AND ";
			}
			$select .="model_year LIKE ".$year." ";
		}
 
		$stmt =	 $dbh->prepare($select);
		if($stmt->execute()){
			$result = $stmt->fetchAll();
			return $result;
		} 
	}
	static public function getConnected($subClass, $id){
		$stmt = self::createConnection();
		$select = "SELECT * FROM ".$subClass." WHERE fk_model = ".$id." ";
		$stmt ->prepare($select);
		if($stmt->execute()){
			$result= $stmt->fetchAll();
		} 
		return $result;
	}
}
?>