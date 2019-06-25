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
			gpu_set_blendmode(bm_add);
	
			draw_surface_ext( surf_final_light, cam_x, cam_y, 1, 1, 0, -1, final_light_alpha);
			
			if (surface_exists(surf_particles))
			{
				draw_surface_ext( surf_particles, cam_x, cam_y, 1, 1, 0, -1, final_light_alpha);
			}
	
			gpu_set_blendmode(bm_normal);
		}
	}