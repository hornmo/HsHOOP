-- -----------------------------------------------------
-- View to see everything
-- -----------------------------------------------------

CREATE VIEW `see_all` 
	(manufacturer, name, model_year, internaloem, generation, segment, 
		process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time,
		length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, ltotal, 
		biw, front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, wtotal, 
		steel, aluminium, magnesium, other, thermoplastics, 
		no_parts, parts100g, parts1kg, parts5kg, parts_more5kg)
	AS SELECT m.manufacturer, m.name, m.model_year, m.internaloem, m.generation, m.segment, 
	pr.process_stability, pr.re_use_factor, pr.mechanisation, pr.intended_production_vol, pr.production_lead_time,
	l.length, l.width, l.height, l.track_front, l.track_rear, l.track_mean, l.wheelbase, l.contact_area, l.total, 
	w.biw, w.front_doors, w.rear_doors, w.hood, w.tailgate, w.front_fenders, w.hinges, w.fuelflap, w.frontend, w.total,
	mm.steel, mm.aluminium, mm.magnesium, mm.other, mm.thermoplastics,
	pa.no_parts, pa.parts100g, pa.parts1kg, pa.parts5kg, pa.parts_more5kg
		FROM model m
			JOIN production pr ON m.id_model = pr.fk_model
			JOIN lengths l ON m.id_model = l.fk_model
			JOIN weights w ON m.id_model = w.fk_model
			JOIN material_mix mm ON m.id_model = mm.fk_model
			JOIN parts pa ON m.id_model = pa.fk_model
		ORDER BY manufacturer;


-- -----------------------------------------------------
-- Views for all manufacturers
-- -----------------------------------------------------

CREATE VIEW `audi` 
	(manufacturer, name, model_year, internaloem, generation, segment, 
		process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time,
		length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, ltotal, 
		biw, front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, wtotal, 
		steel, aluminium, magnesium, other, thermoplastics, 
		no_parts, parts100g, parts1kg, parts5kg, parts_more5kg)
	AS SELECT m.manufacturer, m.name, m.model_year, m.internaloem, m.generation, m.segment, 
	pr.process_stability, pr.re_use_factor, pr.mechanisation, pr.intended_production_vol, pr.production_lead_time,
	l.length, l.width, l.height, l.track_front, l.track_rear, l.track_mean, l.wheelbase, l.contact_area, l.total, 
	w.biw, w.front_doors, w.rear_doors, w.hood, w.tailgate, w.front_fenders, w.hinges, w.fuelflap, w.frontend, w.total,
	mm.steel, mm.aluminium, mm.magnesium, mm.other, mm.thermoplastics,
	pa.no_parts, pa.parts100g, pa.parts1kg, pa.parts5kg, pa.parts_more5kg
		FROM model m
			JOIN production pr ON m.id_model = pr.fk_model
			JOIN lengths l ON m.id_model = l.fk_model
			JOIN weights w ON m.id_model = w.fk_model
			JOIN material_mix mm ON m.id_model = mm.fk_model
			JOIN parts pa ON m.id_model = pa.fk_model
		WHERE manufacturer = 'Audi'
		ORDER BY name;


CREATE VIEW `bmw` 
	(manufacturer, name, model_year, internaloem, generation, segment, 
		process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time,
		length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, ltotal, 
		biw, front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, wtotal, 
		steel, aluminium, magnesium, other, thermoplastics, 
		no_parts, parts100g, parts1kg, parts5kg, parts_more5kg)
	AS SELECT m.manufacturer, m.name, m.model_year, m.internaloem, m.generation, m.segment, 
	pr.process_stability, pr.re_use_factor, pr.mechanisation, pr.intended_production_vol, pr.production_lead_time,
	l.length, l.width, l.height, l.track_front, l.track_rear, l.track_mean, l.wheelbase, l.contact_area, l.total, 
	w.biw, w.front_doors, w.rear_doors, w.hood, w.tailgate, w.front_fenders, w.hinges, w.fuelflap, w.frontend, w.total,
	mm.steel, mm.aluminium, mm.magnesium, mm.other, mm.thermoplastics,
	pa.no_parts, pa.parts100g, pa.parts1kg, pa.parts5kg, pa.parts_more5kg
		FROM model m
			JOIN production pr ON m.id_model = pr.fk_model
			JOIN lengths l ON m.id_model = l.fk_model
			JOIN weights w ON m.id_model = w.fk_model
			JOIN material_mix mm ON m.id_model = mm.fk_model
			JOIN parts pa ON m.id_model = pa.fk_model
		WHERE manufacturer = 'BMW'
		ORDER BY name;


CREATE VIEW `chevrolet` 
	(manufacturer, name, model_year, internaloem, generation, segment, 
		process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time,
		length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, ltotal, 
		biw, front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, wtotal, 
		steel, aluminium, magnesium, other, thermoplastics, 
		no_parts, parts100g, parts1kg, parts5kg, parts_more5kg)
	AS SELECT m.manufacturer, m.name, m.model_year, m.internaloem, m.generation, m.segment, 
	pr.process_stability, pr.re_use_factor, pr.mechanisation, pr.intended_production_vol, pr.production_lead_time,
	l.length, l.width, l.height, l.track_front, l.track_rear, l.track_mean, l.wheelbase, l.contact_area, l.total, 
	w.biw, w.front_doors, w.rear_doors, w.hood, w.tailgate, w.front_fenders, w.hinges, w.fuelflap, w.frontend, w.total,
	mm.steel, mm.aluminium, mm.magnesium, mm.other, mm.thermoplastics,
	pa.no_parts, pa.parts100g, pa.parts1kg, pa.parts5kg, pa.parts_more5kg
		FROM model m
			JOIN production pr ON m.id_model = pr.fk_model
			JOIN lengths l ON m.id_model = l.fk_model
			JOIN weights w ON m.id_model = w.fk_model
			JOIN material_mix mm ON m.id_model = mm.fk_model
			JOIN parts pa ON m.id_model = pa.fk_model
		WHERE manufacturer = 'Chevrolet'
		ORDER BY name;


-- -----------------------------------------------------
-- Views for guests
-- -----------------------------------------------------

CREATE VIEW `guest` 
	(manufacturer, name, model_year, generation, segment, length, width, height, track_front, track_rear, wheelbase, wtotal, steel, aluminium, magnesium, other, thermoplastics, no_parts)
	AS SELECT m.manufacturer, m.name, m.model_year, m.generation, m.segment, l.length, l.width, l.height, l.track_front, l.track_rear, l.wheelbase, w.total,
	mm.steel, mm.aluminium, mm.magnesium, mm.other, mm.thermoplastics, pa.no_parts
		FROM model m
			JOIN lengths l ON m.id_model = l.fk_model
			JOIN weights w ON m.id_model = w.fk_model
			JOIN material_mix mm ON m.id_model = mm.fk_model
			JOIN parts pa ON m.id_model = pa.fk_model
		ORDER BY manufacturer;