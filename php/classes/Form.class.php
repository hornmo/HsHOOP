<?php
include("Results.class.php");

Class Form{
	
	private static $segments = array('A', 'B', 'C', 'D', 'E', 'F', 'S', 'M', 'J');
	private $manufacturer;
	private $name;
	private $model_year;

	public function display($type){
		$req = false;
		if($type == 'select'){
			$req = true;
		}
		echo 	'<html><head><title>OOP-Ausgabe</title></head><body>';
		echo	'<p><a href="select.php">Suche bestimmte Karosserie</a></p>';
		echo	'<p><form name="search" action="" method="post">';
		echo	'<p><div><span>Hersteller:</span></div><input name="manufacturer" value="'.$this->manufacturer.'"';
		if($req){
			echo 'required'; 
		}
		echo 	'></input></p>';
		echo	'<p><div><span>Modell:</span></div><input name="name" value="'.$this->name.'"';
		if($req){
			echo 'required'; 
		}
		echo 	'"></input></p>';
		echo	'<p><div><span>Modelljahr:</span>';
		if($type == 'select')
			echo 	'<p><input name="model_year" required="true"></input></p></p>';
		elseif($type == 'combined'){
			echo	'</div><p><span> >= </span><input name="f:model_year"></input></p><p><span> <= </span><input name="t:model_year"></input></p>';
			echo	'</p><p><span>Fahrzeugklasse: </span><select name="segment">';
			echo	'<option></option>';
			foreach(self::$segments AS $s){
				echo '<option>'.$s.'</option>';
			}
			echo '</select></p>';
			echo	'<p><div><span>Generation:</span></div><input name="generation"></input><p>';
			echo	'<p><div><span>OEM:</span></div><input name="internaloem"></input><p><p>';
		}
		echo	'<input type="submit"></input></p></form></p>';
		if(isset($_POST)){
			$pars = $this->generatePars($type);
			$res = new Results;
			$res->showResults($type, $pars);
		}
		echo	'<div id="bottom"><p>30.06.2015 Hausarbeit im Modul Objektorientierte Programmierung von: Bendixen, Niklas; Horn, Moritz; Peters, Henning Renke</p></div></body></html>';
	}
	public function generatePars($type){
		$parameters = '';
		$inputs = filter_input_array(INPUT_POST);
		if($inputs){
			if($type == 'combined'){
				foreach($inputs AS $k => $v){
					if($v != ''){
						if(strpos($k, "f:") === 0){
							$k = substr($k, 2);	
							$parameters .= $k." >=".$v;
						}
						elseif(strpos($k, "t:") === 0){
							$k = substr($k, 2);
							$parameters .= $k." <=".$v;
						}else{
							$parameters .= $k."='%".$v."%'";
		
						}
						$parameters .= "&";
					}
				}
			}elseif($type == 'select'){
				foreach($inputs AS $k => $v){
					$parameters .= $k."=".$v;
					$parameters .= "&";
				}
			}
			$parameters = substr($parameters, 0, -1);
		}
		return $parameters;
	}
}
?>
