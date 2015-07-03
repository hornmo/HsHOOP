INSERT IGNORE INTO `cars`.`model` (manufacturer, name, generation, model_year, sop, segment, internaloem)
VALUES
	('Audi', 'TT', 3, 2014, "July 2014", 'C', '8S'),
	('BMW', 'i8', 1, 2014, "March 2014", 'S', 'I12'),
	('Chevrolet', 'Corvette Z06', 7, 2014, "Nov 14", 'S', 'Y1BC');

INSERT IGNORE INTO `cars`.`dimensions` (length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, total, fk_model)
VALUES 
	(3968, 1795, 1326, 1446, 1428, 1437, 2355, 3.38, 259, (SELECT DISTINCT id_model FROM model WHERE name='TT' AND generation='3')),
	(4455, 1903, 1265, 1512, 1578, 1545, 2632, 4.067, 260.2, (SELECT DISTINCT id_model FROM model WHERE name='i8' AND generation='1')),
	(4268, 1918, 1210, 1472, 1442, 1457, 2547, 3.711, 278.82, (SELECT DISTINCT id_model FROM model WHERE name='Corvette Z06' AND generation='7'));
	
INSERT IGNORE INTO `cars`.`weights` (front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, total, fk_model)
VALUES
	(20.6, NULL, 9.7, 10, 1.6, 8.6, 0, NULL, 209, (SELECT DISTINCT id_model FROM model WHERE name='TT' AND generation='3')),
	(18.048, NULL, 7.05, 2.3, 5.6, 6.298, 0, 7.708, 229.4, (SELECT DISTINCT id_model FROM model WHERE name='i8' AND generation='1')),
	(33.42, NULL, 4.63, 10.23, 9.46, 13.16, 0, 0, 207.9, (SELECT DISTINCT id_model FROM model WHERE name='Corvette Z06' AND generation='7'));
	
INSERT IGNORE INTO `cars`.`material_mix` (steel, aluminium, magnesium, thermoplastics, other, control, fk_model) 
VALUES
	(65, 33.8, 0, 0, 1.2, 100, (SELECT DISTINCT id_model FROM model WHERE name='TT' AND generation='3')),
	(6, 22, 0, 60, 12, 100, (SELECT DISTINCT id_model FROM model WHERE name='i8' AND generation='1')),
	(11, 53, 0, 33, 3, 100, (SELECT DISTINCT id_model FROM model WHERE name='Corvette Z06' AND generation='7'));
	
INSERT IGNORE INTO `cars`.`production` (process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time, fk_model)
VALUES
	(NULL, NULL, NULL, NULL, NULL, (SELECT DISTINCT id_model FROM model WHERE name='TT' AND generation='3')),
	(NULL, 0, 99, 8000, 700, (SELECT DISTINCT id_model FROM model WHERE name='i8' AND generation='1')),
	(82, 0, 98, 36000, 190, (SELECT DISTINCT id_model FROM model WHERE name='Corvette Z06' AND generation='7'));
	
INSERT IGNORE INTO `cars`.`parts` (no_parts, parts100g, parts1kg, parts5kg, parts_more5kg, fk_model)
VALUES
	(304, NULL, NULL, NULL, NULL, (SELECT DISTINCT id_model FROM model WHERE name='TT' AND generation='3')),
	(131, 28, 76, 18, 9, (SELECT DISTINCT id_model FROM model WHERE name='i8' AND generation='1')),
	(749, 26, 646, 73, 4, (SELECT DISTINCT id_model FROM model WHERE name='Corvette Z06' AND generation='7'));