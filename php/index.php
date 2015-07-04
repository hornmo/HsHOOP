<?php
include_once("classes/Body.class.php");
?>
<html>
	<head>
		<title>OOP-Ausgabe</title>
	</head>
	<body>
		<div id="top">
		</div>

		<div id="main">
			<p>
				<a href="select.php">Suche bestimmte Karosserie</a>
			</p>
			<p>
				<form method="post">
					<p>
						<div>Hersteller: </div><input name="manufacturer"></input>
					</p>
					<p>
						<div>Modell: </div><input name="name"></input>
					</p>
					<p>
						<div>Modelljahr: </div><span>Von:</span><input name="f:model_year"></input><span>Bis:</span><input name="t:model_year"></input>
					</p>
					<p>
						<span>Fahrzeugklasse: </span>
						<select name="segment">
							<option></option>
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
							<option>E</option>
							<option>F</option>
							<option>S</option>
							<option>M</option>
							<option>J</option>
						</select>
					</p>
					<p>
						<div>OEM: </div><input name="internaloem"></input>
					<p>
						<input type="submit"></input>
					</p>
				</form>
				<?php
					$parameters = '';
					$vars = false;
					$atrs = get_defined_vars();
					if($atrs['_POST']){
						foreach($atrs['_POST'] AS $k => $v){
							if($v != ''){
								$vars = true;
								if(strpos($k, "f:") !== false){
									$k = substr($k, 2);	
									$parameters .= $k." >=".$v;
								}
								elseif(strpos($k, "t:") !== false){
									$k = substr($k, 2);
									$parameters .= $k." <=".$v;
								}else{
									$parameters .= $k."='%".$v."%'";
								}
								$parameters .= "&";
							}
						}
						$parameters = substr($parameters, 0, -1);
					}
					if($vars){
						$bodies = CarBody::sucheNachParameter($parameters);
						echo '<p>Ergebnis für Suche nach: '.$parameters.'</p>';
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
						}else{
							echo $bodies;
						}
					}
				?>
				<?php
					// $r = CarBody::suche('Chevrolet','','2014');
					// $arr = $r->getValues();
					// print_r($arr);
				?>
			</p>
			<p>
				<?php
					// $v = CarBody::sucheNachParameter("manufacturer='Chevr%'&name='Corve%'");
					// print_r($v);
				?>
			</p>
			<p>
				<?php
					// $v = Dimensions::getByID(3);
					// var_dump($v);
				?>
			</p>
			<table>
				<thead>
				<?php
					// $c = CarBody::showDetails(3);
					// print_r($c);
				?>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div id="bottom">
			<p>30.06.2015 Hausarbeit im Modul Objektorientierte Programmierung von: 
				Bendixen, Niklas; Horn, Moritz; Peters, Henning Renke</p>
		</div>
	</body>
</html>
