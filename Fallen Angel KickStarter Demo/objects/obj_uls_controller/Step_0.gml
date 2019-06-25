/// @description Particle Spawn

	//Particles
	if (surf_particles)
	{
		var cam_id	= view_get_camera(view_current);
		var cam_x	= camera_get_view_x(cam_id);
		var cam_y	= camera_get_view_y(cam_id);
		var cam_w	= camera_get_view_width(cam_id);
		var cam_h	= camera_get_view_height(cam_id);
	
		part_particles_create(part_sys, cam_x + random(cam_w), cam_y + random(cam_h*0.75), part_dust_light, choose(2,3));
	}