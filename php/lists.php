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
							}
						}
					}
					if(isset($_POST['manufacturer'])){
						$parameters .= "manufacturer='".$_POST['manufacturer']."%'";
					}
					if(isset($_POST['name']) && $_POST['name'] != ''){
						$parameters .= "name='".$_POST['name']."%'";
					}
					if(isset($_POST['year'])){
						$parameters .= "year=".$_POST['year'];
					}
					if($vars){
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
				<p>
				<?php
					// $r = CarBody::suche('Chevrolet','','2014');
					// echo '!suche!';
					// print_r($r);
				?>
				</p>
			</p>
			<p>
				// <?php
					// $v = CarBody::sucheNachParameter("manufacturer='Chevrolet'");
					// echo '!parameters!';
					// print_r($v);
				// ?>
			</p>
			<table>
				<thead>
				<?php
					echo '<th></th>';
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
