<?php
include_once("classes/Body.class.php");
?>
<html>
	<head>
		<title>OOP-Ausgabe</title>
	</head>
	<body>
		<div id="top">
			<h1>Headline</h1>
		</div>

		<div id="main">
			<p>
				<form method="post">
					<p>
						<div>Hersteller: </div><input name="man"></input>
					</p>
					<p>
						<div>Modell: </div><input name="name"></input>
					</p>
					<p>
						<div>Modelljahr: </div><input name="year"></input>
					</p>
					<p>
						<input type="submit"></input>
					</p>
				</form>
				<?php
					$man = '';
					$name = '';
					$year = '';
					$body = null;
					if(isset($_POST['man'])){
						$man = $_POST['man'];
					}
					if(isset($_POST['name'])){
						$name = $_POST['name'];
					}
					if(isset($_POST['year'])){
						$year = $_POST['year'];
					}
					if($man != '' && $name != '' && $year != ''){
						$body = CarBody::suche($man, $name, $year);
						echo '<table>';
						echo '<thead>';
						foreach($body AS $b){
							echo '<th></th>'
						}
						echo '</thead>'
						echo '</tbody>'
						foreach($body AS $b){
							echo '<td><td>'
						}
						echo '</table>';
					}else{
						echo "man:".$man;
						echo "name:".$name;
						echo "year:".$year;
					}
				?>
				<?php
					// $r = CarBody::suche('Chevrolet','','2014');
					// print_r($r);
				?>
			</p>
			<p>
				<?php
					$v = CarBody::getValues();
					print_r($v);
				?>
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
