<?php
include("Body.class.php");

Class Results{
	public static function showResults($mode = 'combined', $pars = NULL){
		if(isset($_GET['pars'])){
			$pars = $_GET['pars'];
		}
		if(is_string($pars) && $pars != ''){
			if($mode == 'combined'){
				$bodies = CarBody::sucheNachParameter($pars);
			}elseif($mode == 'select'){
				$arr = explode('&', $pars);
				$m = NULL;
				$n = NULL;
				$y = NULL;
				foreach($arr AS $par){
					$p = explode('=', $par);
					if($p[0] == 'manufacturer'){
						$m = $p[1];
					}
					if($p[0] == 'name'){
						$n = $p[1];
					}
					if($p[0] == 'model_year'){
						$y = $p[1];
					}
				} 
				$body = CarBody::suche($m, $n, $y);
				$bodies[] = $body;
			}
			echo '<p>Ergebnis für Suche nach: '.$pars.'</p>';
			if(is_object($bodies[0])){
				echo '<table style="border:1px solid black;">';
				echo '<thead>';
				$body = $bodies[0]->getValues();
				foreach($body['model'] AS $k => $b){
					echo '<th>'.$k.'</th>';
				}
				echo '<th>Details</th>';
				echo '</thead>';
				echo '<tbody>';
				foreach($bodies AS $b){
					$b = $b->getValues();
					$id = NULL;
					echo '<tr>';
					foreach($b['model'] AS $key => $col){
						if($key == 'id_model'){
							$id = $col;
						}
						echo '<td>';
						echo $col;
						echo '</td>';
					}
					echo '<td><a href="details.php?id='.$id.'">Details anzeigen</a></td>';
					echo '</tr>';
				}
				echo '</tbody>';
				echo '</table>';
			}
		}
	}
	public static function showDetails($id = NULL){
			if(isset($_GET['id'])){
				$id = $_GET['id'];
			}
			if($id != 'ID'){
				$body = CarBody::showDetails($id);
				$body = $body->getValues();
			}
			echo '<table>';
			echo '<thead>';
			foreach($body AS $k => $b){
				echo '<th>'.$k.'</th>';
			}
			echo '</thead>';
			echo '<tbody>';
			foreach($body AS $k => $b){
				echo '<td style="border:1px solid black;vertical-align:top;">';
				echo '<table>';
				echo '<thead>';
				echo '</thead>';
				echo '<tbody>';
				foreach($b AS $key => $value){
					echo '<tr><td>'.$key.'</td><td style="min-width:30px;text-align:right;">'.$value.'</td></tr>';
				}
				echo '</tbody>';
				echo '</table>';
				echo '</td>';
			}
			echo '</tbody>';
			echo '<table>';
	}
}
?>
