<?php
include_once("User.class.php");


class DatabaseHandler{
	
	// Verbindungsdaten für die Datenbank
	
	private static $user = "root";
	private static $password = "";
	private static $host = "";
	private static $schema = "cars";
	
	// Stellt eine Datenbankverbindung mit den gegebenen Login-Daten her
	
	static private function createConnection($host, $schema, $user, $password) {
				
		$dbh = new PDO("mysql:host=$host;dbname=$schema;port=3306;charset=utf8", $user, $password);
		$dbh -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $dbh;
	}
	
	// Stellt DB-Abfrage für Karosserie(n) nach Hersteller, Name, Jahr (für eindeutige Ergebnisse benutze getBodyByID())
	
	static public function getBodyByPars($man, $name, $year){
		$dbh = self::createConnection(self::$host, self::$schema, self::$user, self::$password);
		$select = "SELECT * FROM bodies WHERE ";
		if($man != ''){
			$select .= "manufacturer LIKE '".$man."' ";
		}
		if($name != ''){
			if($man){
				$select .= "AND ";
			}
			$select .="name LIKE '".$name."' ";
		}
		if($year != ''){
			if($man || $name){
				$select .= "AND ";
			}
			$select .="model_year LIKE '".$year."' ";
		}
		try{
			$stmt =	$dbh->prepare($select);
			$stmt->execute();
			$result = $stmt->fetchAll(PDO::FETCH_CLASS, "CarBody");
			if($result){
				$user = User::get();
				$result = $user->filterList($result);
				return $result;
			}else{
				return 'Fehler!'.$man.$name.$year.'';
			}
		}catch(PDOException $e){
			return 'Fehler bei der Anfrage!';
		}
	}
	
	// Stellt DB-Abfrage für eine Karosserie nach ID und gibt diese als CarBody-Objekt zurück
	
	static public function getBodyByID($id){
		$dbh = self::createConnection(self::$host, self::$schema, self::$user, self::$password);
		$select = "SELECT * FROM bodies WHERE ";
		if($id){
			$select .= "id_model = ".$id;
		}
		try{
			$stmt =	$dbh->prepare($select);
			$stmt->execute();
			$result = $stmt->fetchAll(PDO::FETCH_CLASS, "CarBody");
			if($result){
				$user = User::get();
				$result = $user->filterList($result);
				return $result[0];
			}else{
				return 'Fehler!'.$id;
			}
		}catch(PDOException $e){
			return 'Fehler bei der Anfrage!';
		}
	}
	
	// Stellt eine DB-Abfrage für eine untergeordnete Klasse einer Karosserie und gibt ein Objekt dieser Klasse zurück
	
	static public function getConnected($table, $subClass, $id){
		$dbh = self::createConnection(self::$host, self::$schema, self::$user, self::$password);
		$select = "SELECT * FROM v_".$table." WHERE fk_model = ".$id." ";
		try{
			$stmt = $dbh->prepare($select);
			$stmt->execute();
			$result= $stmt->fetchAll(PDO::FETCH_CLASS, $subClass);
			if($result){
				$user = User::get();
				$result = $user->filterList($result);
				return $result[0];
			}else{
				return array($subClass, 0);
			}	
		}catch(PDOException $e){
			return 'Fehler bei der Anfrage!';
		}
	}
	
	// Gibt ein Array von CarBody-Objekten als Ergebnis einer freien Parametersuche zurück
	
	static public function getBodies($parameters){
		$dbh = self::createConnection(self::$host, self::$schema, self::$user, self::$password);
		$select = "SELECT * FROM bodies WHERE ";
		// Überprüft, ob Parameter mit der richtigen Syntax - COLUMN=WERT - vorliegen
		if(strpos($parameters, '=') !== false){
			// Überprüft, ob mehrere Parameter vorliegen - Getrennt durch '&'
			if(strpos($parameters, '&') !== false){
				// Teilt Parameter auf
				$arr = explode('&', $parameters);
				foreach($arr AS $p){
					$ki = explode('=', $p);
					// Überprüfe, ob Parameter als String markiert - durch 'WERT'
					if(strpos($ki[1], "'") !== false){
						$select .= $ki[0]." LIKE ".$ki[1];
					}else{
						$select .= $ki[0]."= ".$ki[1];
					}
					$select .= " AND ";
				} 
				$select = substr($select, 0, -5);
			// Falls nur ein Parameter vorliegt
			}else{
				$kv = explode('=', $parameters);
				// Überprüfe, ob Parameter als String markiert - durch 'WERT'
				if(strpos($kv[1], "'") !== false){
					$select .= $kv[0]." LIKE ".$kv[1];
				}else{
					$select .= $kv[0]."= ".$kv[1];
				}
			}
		}else{
			return 'Fehler bei der Parameterübergabe: '.$parameters;
		}
		try{
			$stmt = $dbh->prepare($select);
			$stmt->execute();
			$results = array();
			while($row = $stmt->fetchObject('CarBody')){
				$results[] = $row;
			}
			if($results){
				$user = User::get();
				$results = $user->filterList($results);
				return $results;
			}
		}catch(PDOException $e){
			return 'Fehler bei Anfrage:'.$select;
		}
	}
}
?>
