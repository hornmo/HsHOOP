<?php
include("Results.class.php");

Class Form{
	
	private static $segments = array('A', 'B', 'C', 'D', 'E', 'F', 'S', 'M', 'J');

	public function display($type = 'combined'){
		$req = false;
		if($type == 'select'){
			$req = true;
		}
		echo 	'<html><head><title>OOP-Ausgabe</title></head><body>';
		echo	'<p><a href="select.php">Suche bestimmte Karosserie</a></p>';
		echo	'<p><form name="search" action="" method="post">';
		echo	'<p><div><span>Hersteller:</span></div><input name="manufacturer"';
		if($req){
			echo 'required'; 
		}
		echo 	'></input></p>';
		echo	'<p><div><span>Modell:</span></div><input name="name"';
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
			echo 	'</select></p>';
			echo	'<p><div><span>OEM:</span></div><input name="internaloem"></input></p>';
			echo 	'<p><div><span>Production Site:</span></div><input name="production_sites"></p>';
			echo	'<p><div><span>Gesamtgewicht:</span></div>';
			echo	'</div><p><span> >= </span><input name="f:weight_total"></input></p><p><span> <= </span><input name="t:weight_total"></input></p>';
			echo	'<p>Wertebereichssuche:</p>';
			echo	'<p><span>Feld: </span><input type="text" name="free"></input>';
			echo	'<span> Von: </span><input type="text" name="range_from"></input><span> Bis: </span><input type="text" name="range_to"></input></p>';
		}
		echo	'<input type="submit"></input></p></form></p>';
		if(isset($_POST)){
			$pars = $this->generatePars($type);
			$res = new Results;
			$res->showResults($type, $pars);
		}
		echo	'<div id="bottom"><p>30.06.2015 Hausarbeit im Modul Objektorientierte Programmierung von: Bendixen, Niklas; Horn, Moritz; Peters, Henning Renke</p></div></body></html>';
	}
	private function generatePars($type){
		$parameters = '';
		$inputs = filter_input_array(INPUT_POST);
		if($inputs){
			if($type == 'combined'){
				if($inputs['free']){
					$field = $inputs['free'];
					if($inputs['range_from']){
						$inputs['f:'.$field] = $inputs['range_from'];
						unset($inputs['range_from']);
					}
					if($inputs['range_to']){
						$inputs['t:'.$field] = $inputs['range_to'];
						unset($inputs['range_to']);
					}
					unset($inputs['free']);
				}
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
