/// @description Clean Up

	//Destroy Each Light
	with(obj_uls_light)
	{
		instance_destroy();
	}
	
	//Clean Surface
	if (surface_exists(surf_final_light))
	{
		surface_free(surf_final_light);
	}
	if (surface_exists(surf_particles))
	{
		surface_free(surf_particles);
	}
	if (surface_exists(surf_aux_blur))
	{
		surface_free(surf_aux_blur);
	}
	
	//Clean particle system
	part_system_destroy(part_sys);
	
	//Destroy aux
	with(obj_uls_light_renderer)
	{
		instance_destroy();
	}
	with(obj_uls_shadow_renderer)
	{
		instance_destroy();
	}