<?php
include_once("User.class.php");


class DatabaseHandler{
	private static $user = "root";
	private static $password = "";
	private static $host = "";
	private static $schema = "cars";
	
	static private function createConnection($host, $schema, $user, $password) {
		
		$dbh = new PDO("mysql:host=$host;dbname=$schema;port=3306;charset=utf8", $user, $password);
		$dbh -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $dbh;
	}
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
 
		$stmt =	$dbh->prepare($select);
		$stmt->execute();
		$login = User::get();
		$result = $stmt->fetchAll(PDO::FETCH_CLASS, "CarBody");
		if($result){
			$user = User::get();
			$result = $user->filterList($result);
			return $result;
		}else{
			return 'Fehler!'.$man.$name.$year.'';
		}
	}
	static public function getBodyByID($id){
		$dbh = self::createConnection('localhost', 'cars', 'root', '');
		$select = "SELECT * FROM details WHERE ";
		if($id){
			$select .= "id_model = ".$id;
		}
		$stmt =	$dbh->prepare($select);
		$stmt->execute();
		$login = User::get();
		$result = $stmt->fetchAll(PDO::FETCH_CLASS, "CarBody");
		if($result){
			$user = User::get();
			$result = $user->filterList($result);
			return $result;
		}else{
			return 'Fehler!'.$id;
		}
	}
	static public function getTables(){
	}
	static public function getConnected($subClass, $id){
		$dbh = self::createConnection('localhost', 'cars', 'root', '');
		$select = "SELECT * FROM ".$subClass." WHERE fk_model = ".$id." ";
		try{
			$stmt = $dbh->prepare($select);
			$stmt->execute();
			$result= $stmt->fetchAll(PDO::FETCH_CLASS, $subClass);
			if($result){
				$user = User::get();
				$results = $user->filterList($result);
				return $result;
			}else{
				return array($subClass, 0);
			}	
		}catch(PDOException $e){
			return 'Fehler bei der Anfrage: '.$e;
		}
	}
	static public function getBodies($parameters){
		$dbh = self::createConnection('localhost', 'cars', 'root', '');
		$select = "SELECT * FROM details WHERE ";
		if(strpos($parameters, '=') !== false){
			if(strpos($parameters, '&') !== false){
				$arr = explode('&', $parameters);
				$kv = explode('=', $arr[0]);
				if(strpos($kv[1], "'") !== false){
					$select .= $kv[0]." LIKE ".$kv[1];
				}else{
					$select .= $kv[0]." = ".$kv[1];
				}
				$arr = array_splice($arr,0,1);
				foreach($arr AS $p){
					$select .= " AND ";
					$ki = explode('=', $p);
					if(strpos($ki[1], "'") !== false){
						$select .= $ki[0]." LIKE ".$ki[1];
					}else{
						$select .= $ki[0]." = ".$ki[1];
					}
				} 
			}else{
				$kv = explode('=', $parameters);
				if(strpos($kv[1], "'") !== false){
					$select .= $kv[0]." LIKE ".$kv[1];
				}else{
					$select .= $kv[0]." = ".$kv[1];
				}
			}
		}else{
			return 'Fehler bei der Parameterübergabe:'.$parameters;
		}
		try{
			$stmt = $dbh->prepare($select);
			$stmt->execute();
			$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
			if($results){
				$user = User::get();
				$results = $user->filterList($results);
				return $results;
			}else{
				return 'Fehler!'.$select;
			}
		}catch(PDOException $e){
			return 'Fehler bei Anfrage:'.$select;
		}
	}
	static public function insertBody($parameters){
		$dbh = self::createConnection('localhost', 'cars', 'root', '');
		$insert = "INSERT INTO ";
		if(strpos($parameters, '=') !== false){
			
		}
	}
}
?>
