/// @description Clean Up

	//Surface
	if (surface_exists(light_surf))
	{
		surface_free(light_surf);
	}