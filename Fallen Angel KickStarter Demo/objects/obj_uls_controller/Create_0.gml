/// @description Initializing Values

	//Circle Precision
	draw_set_circle_precision(128);
	
	//Surface
	surf_final_light	= -1;
	surf_particles		= -1;
	final_light_alpha = 0.95;
	
	//Shader Light
	uni_sh_color = shader_get_uniform( sh_lighten, "shadow_color");
	array_shadow_color = array_create(4, 0);
	
	array_shadow_color[3] = image_alpha;	//Alpha
	array_shadow_color[0] = color_get_red(image_blend)		*0.003921568; //Red
	array_shadow_color[1] = color_get_green(image_blend)	*0.003921568; //Green
	array_shadow_color[2] = color_get_blue(image_blend)		*0.003921568; //Blue
	
	//Set alpha again
	image_alpha = 1;
	
	//Particles
	part_sys = part_system_create();
	part_system_automatic_draw(part_sys, false);
	
		scr_initialize_particle_system();
	
	array_particle_mask = array_create(4, 0);
	array_particle_mask[3] = 1;
	
	//Shader Gaussian Blur
	uni_v_resolution_h = shader_get_uniform(sh_gaussian_blur_h,"v_resolution");
	uni_v_resolution_v = shader_get_uniform(sh_gaussian_blur_v,"v_resolution");

	uni_v_blur_intensity_h	= shader_get_uniform(sh_gaussian_blur_h,"v_blur_intensity");
	uni_v_blur_intensity_v	= shader_get_uniform(sh_gaussian_blur_v,"v_blur_intensity");

	surf_aux_blur = -1;

	//Creating Instances
	instance_create_depth( x, y, light_depth, obj_uls_light_renderer);
	instance_create_depth( x, y, shadow_depth, obj_uls_shadow_renderer);