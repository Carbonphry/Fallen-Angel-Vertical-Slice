///scr_initialize_particle_system()
///@Description Customizable particle system values
	
	//Particle dust light menu
	var part_index = part_type_create();
	part_dust_light = part_index;
			
		part_type_shape(part_index, pt_shape_disk);
		part_type_size(part_index, 0.001, 0.055, 0, 0);
		part_type_color3(part_index, c_orange, make_color_rgb(255, 242, 186), c_orange);
		part_type_alpha3(part_index, 0, 0.95, 0);
			
		//part_type_life(part_index, 330, 530);
		part_type_life(part_index, 10, 300);
		part_type_blend(part_index, true);
			
		part_type_direction(part_index, 280, 350, 0, 0.2);
		part_type_speed(part_index, 0.012, 0.55, 0.000004, 0.004);