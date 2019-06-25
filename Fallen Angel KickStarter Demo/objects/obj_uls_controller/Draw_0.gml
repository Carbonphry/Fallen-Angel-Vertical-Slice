/// @description Drawing Final Light

	//Applying into the final surface
	var cam_id = view_get_camera(view_current);
	
	if( !surface_exists(surf_final_light) )
	{
		surf_final_light = surface_create( camera_get_view_width(cam_id), camera_get_view_height(cam_id));
	}
	
	//Draw
	surface_set_target(surf_final_light);
	draw_clear_alpha(0,1);
	
	gpu_set_blendmode(bm_add);
	
	with(obj_uls_light)
	{
		//Check
		if (Visible and visible)
		{
			//Get cam
			var cam_id = view_get_camera(0);
		
			//Draw
			if (surface_exists(light_surf))
			{
				draw_surface_ext( light_surf, x - (surface_get_width(light_surf)*0.5) - camera_get_view_x(cam_id), y - (surface_get_height(light_surf)*0.5) - camera_get_view_y(cam_id), 1, 1, 0, image_blend, image_alpha);
			}
		}
	}
	
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	//Check blur effect
	if (blur_effect_intensity > 0)
	{
		//Aux surface
		if( !surface_exists(surf_aux_blur) )
		{
			surf_aux_blur = surface_create( camera_get_view_width(cam_id), camera_get_view_height(cam_id));
		}
		
		//Resolution gather
		var v_res_w = surface_get_width(surf_final_light);
		var v_res_h = surface_get_height(surf_final_light);
		
		//Horizontal
		surface_set_target(surf_aux_blur);
		shader_set(sh_gaussian_blur_h);
		shader_set_uniform_f(uni_v_resolution_h, v_res_w, v_res_h);
		shader_set_uniform_f(uni_v_blur_intensity_h, blur_effect_intensity);
		
			draw_surface(surf_final_light, 0, 0);
			
		shader_reset();
		surface_reset_target();
		
		//Vertical
		surface_set_target(surf_final_light);
		shader_set(sh_gaussian_blur_v);
		shader_set_uniform_f(uni_v_resolution_v, v_res_w, v_res_h);
		shader_set_uniform_f(uni_v_blur_intensity_v, blur_effect_intensity);
		
			draw_surface(surf_aux_blur, 0, 0);
			
		shader_reset();
		surface_reset_target();
	}
	
	//Draw particles
	if (particle_layer)
	{
		//Check
		if( !surface_exists(surf_particles) )
		{
			surf_particles = surface_create( camera_get_view_width(cam_id), camera_get_view_height(cam_id));
		}
		
		//Start
		surface_set_target(surf_particles);
		draw_clear_alpha(0,0);
		
		//Draw
		part_system_position(part_sys, - camera_get_view_x(cam_id), - camera_get_view_y(cam_id));
		part_system_drawit(part_sys);
		
		//Mask
		gpu_set_blendmode(bm_subtract);
		shader_set(sh_lighten)
		shader_set_uniform_f_array(uni_sh_color, array_particle_mask);
	
			draw_surface_ext( surf_final_light, 0, 0, 1, 1, 0, -1, 1);
	
		shader_reset();
		gpu_set_blendmode(bm_normal);
		
		//End
		surface_reset_target();
	}