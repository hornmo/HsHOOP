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
					$m = NULL;
					$n = NULL;
					$y = NULL;

					if(isset($_POST['manufacturer'])){
						$m = $_POST['manufacturer'];
					}
					if(isset($_POST['name']) && $_POST['name'] != ''){
						$n = $_POST['name'];
					}
					if(isset($_POST['model_year'])){
						$y = $_POST['model_year'];
					}
					if($m && $n && $y){
						$body = CarBody::suche($m, $n, $y);
						$body = $body->getValues();
						$id = $body['model']['id_model'];
						echo '<table style="border:1px solid black;">';
						echo '<thead>';
						foreach($body['model'] AS $k => $b){
							echo '<th>'.$k.'</th>';
						}
						echo '<th>Details</th>';
						echo '</thead>';
						echo '<tbody>';
						echo '<tr>';
						foreach($body['model'] AS $col){
							echo '<td>';
							echo $col;
							echo '</td>';
						}
						echo '<td><a href="details.php?id='.$id.'">Details anzeigen</a></td>';
						echo '</tr>';
						echo '</tbody>';
						echo '</table>';
					}
				?>
			</p>
		</div>
		<div id="bottom">
			<p>30.06.2015 Hausarbeit im Modul Objektorientierte Programmierung von: 
				Bendixen, Niklas; Horn, Moritz; Peters, Henning Renke</p>
		</div>
	</body>
</html>
