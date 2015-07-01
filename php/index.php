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
				<a href="lists.php">Suche nach Kriterien</a>
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
						<div>Modelljahr: </div><input name="model_year"></input>
					</p>
					<p>
						<span>Segment: </span>
						<select name="segment">
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
							<option>S</option>
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
								$l = array('manufacturer','name','internaloem','segment');
								if(!in_array($k,$l)){
									$parameters .= $k."=".$v."&";
								}
							}
						}
					}
					if(isset($_POST['manufacturer']) && $_POST['manufacturer'] != ''){
						$parameters .= "manufacturer='%".$_POST['manufacturer']."%'&";
					}
					if(isset($_POST['name']) && $_POST['name'] != ''){
						$parameters .= "name='%".$_POST['name']."%'&";
					}
					if(isset($_POST['segment'])){
						$parameters .= "segment='".$_POST['segment']."'&";
					}
					if($vars){
						print_r($parameters);
						$body = CarBody::sucheNachParameter($parameters);
						echo '<table style="border:1px solid black;">';
						echo '<thead>';
						foreach($body[0] AS $k => $b){
							echo '<th>'.$k.'</th>';
						}
						echo '<th>Details</th>';
						echo '</thead>';
						echo '<tbody>';
						foreach($body AS $col){
							if($col['id_model']){
								$id = $col['id_model'];
							}
							echo '<tr>';
							foreach($col AS $k => $b){
								echo '<td>';
								echo $b;
								echo '</td>';
							}
							echo '<td><a href="details.php?id='.$id.'">Details anzeigen</a></td>';
							echo '</tr>';
						}
						echo '</tbody>';
						echo '</table>';
					}
				?>
				<?php
					$r = CarBody::suche('Chevrolet','','2014');
					$arr = $r[0]->getValues();
					print_r($arr);
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
					$v = Dimensions::getByID(3);
					var_dump($v);
				?>
			</p>
			<table>
				<thead>
				<?php
					$c = CarBody::showDetails(3);
					print_r($c);
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
