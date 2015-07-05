
CREATE VIEW bodies (manufacturer, name, model_year, internaloem, generation, sop, segment, id_model)
	AS SELECT m.manufacturer, m.name, m.model_year, m.internaloem, m.generation, m.sop, m.segment, m.id_model
		FROM model m
	ORDER BY manufacturer;


-- -----------------------------------------------------
-- View to see everything
-- -----------------------------------------------------

CREATE VIEW details (id_model, manufacturer, name, model_year, sop, segment, internaloem, generation, 
		process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time,
		length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, dimensions_total, 
		biw, front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, weight_total, 
		steel, aluminium, magnesium, other, thermoplastics, 
		no_parts, parts100g, parts1kg, parts5kg, parts_more5kg)
	AS SELECT m.id_model, m.manufacturer, m.name, m.model_year, m.sop, m.segment, m.internaloem, m.generation,
		pr.process_stability, pr.re_use_factor, pr.mechanisation, pr.intended_production_vol, pr.production_lead_time,
		d.length, d.width, d.height, d.track_front, d.track_rear, d.track_mean, d.wheelbase, d.contact_area, d.total, 
		w.biw, w.front_doors, w.rear_doors, w.hood, w.tailgate, w.front_fenders, w.hinges, w.fuelflap, w.frontend, w.total,
		mm.steel, mm.aluminium, mm.magnesium, mm.other, mm.thermoplastics,
		pa.no_parts, pa.parts100g, pa.parts1kg, pa.parts5kg, pa.parts_more5kg
		FROM model m
			INNER JOIN production pr ON m.id_model = pr.fk_model
			INNER JOIN dimensions d ON m.id_model = d.fk_model
			INNER JOIN weights w ON m.id_model = w.fk_model
			INNER JOIN material_mix mm ON m.id_model = mm.fk_model
			INNER JOIN parts pa ON m.id_model = pa.fk_model
		ORDER BY manufacturer;

-- -----------------------------------------------------
-- Views for Details
-- -----------------------------------------------------

CREATE VIEW v_production (process_stability, re_use_factor, mechanisation, intended_production_vol, production_lead_time, fk_model)
	AS SELECT pr.process_stability, pr.re_use_factor, pr.mechanisation, pr.intended_production_vol, pr.production_lead_time, pr.fk_model
		FROM model m
			JOIN production pr ON m.id_model = pr.fk_model;
			
CREATE VIEW v_dimensions (length, width, height, track_front, track_rear, track_mean, wheelbase, contact_area, dimensions_total, fk_model)
	AS SELECT d.length, d.width, d.height, d.track_front, d.track_rear, d.track_mean, d.wheelbase, d.contact_area, d.total, d.fk_model
		FROM model m
			JOIN dimensions d ON m.id_model = d.fk_model;
			
CREATE VIEW v_weights (biw, front_doors, rear_doors, hood, tailgate, front_fenders, hinges, fuelflap, frontend, weight_total, fk_model)
	AS SELECT w.biw, w.front_doors, w.rear_doors, w.hood, w.tailgate, w.front_fenders, w.hinges, w.fuelflap, w.frontend, w.total, w.fk_model
		FROM model m
			JOIN weights w ON m.id_model = w.fk_model;
			
CREATE VIEW v_material_mix (steel, aluminium, magnesium, other, thermoplastics, fk_model)
	AS SELECT mm.steel, mm.aluminium, mm.magnesium, mm.other, mm.thermoplastics, mm.fk_model
		FROM model m
			JOIN material_mix mm ON m.id_model = mm.fk_model;

CREATE VIEW v_parts (no_parts, parts100g, parts1kg, parts5kg, parts_more5kg, fk_model)
	AS SELECT pa.no_parts, pa.parts100g, pa.parts1kg, pa.parts5kg, pa.parts_more5kg, pa.fk_model
		FROM model m
			JOIN parts pa ON m.id_model = pa.fk_model;