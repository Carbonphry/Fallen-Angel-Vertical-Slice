/// @description Draw

	//Render the surface from light controller
	with(obj_uls_controller)
	{
		//Render Light Post Processing
		if (surface_exists(surf_final_light))
		{
			//Get Camera
			var cam_id = view_get_camera(view_current);
			var cam_x = camera_get_view_x(cam_id);
			var cam_y = camera_get_view_y(cam_id);
			
			//Render
			shader_set(sh_lighten)
			shader_set_uniform_f_array(uni_sh_color, array_shadow_color);
	
			draw_surface_ext( surf_final_light, cam_x, cam_y, 1, 1, 0, -1, 1);
	
			shader_reset();
		}
	}