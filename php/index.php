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
				<?php
					$r = CarBody::sucheNachParameter('Chevrolet','','2014');
					print_r($r);
				?>
			</p>
		</div>

		<div id="bottom">
			<p>30.06.2015 Hausarbeit im Modul Objektorientierte Programmierung von: 
				Bendixen, Niklas; Horn, Moritz; Peters, Henning Renke</p>
		</div>
	</body>
</html>
