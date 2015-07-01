<?php
include_once("classes/Body.class.php");
?>
<html>
	<head>
	</head>
	<body>
		<div>
			<a href="index.php">zurück zum Index</a>
		</div>
		<div>
		<?php
			if(isset($_GET['id'])){
				$id = $_GET['id'];
				$body = CarBody::showDetails($id);
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
				echo '<table style="border-collapse:collapse;">';
				echo '<thead>';
				echo '</thead>';
				echo '<tbody>';
				foreach($b AS $key => $value){
					echo '<tr style="border-bottom:1px solid black;"><td>'.$key.'</td><td style="border-left:1px solid black;min-width:30px;text-align:right;">'.$value.'</td></tr>';
				}
				echo '</tbody>';
				echo '</table>';
				echo '</td>';
			}
			echo '</tbody>';
			echo '<table>';
			print_r($body);
		?>
		</div>
	</body>
</html>