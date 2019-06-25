///@description set if the particle drawing is enabled or not
///@param enable

with(obj_uls_controller)
{
	//Set 
	particle_layer = argument0;
	
	//Drop
	if (particle_layer == false)
	{
		if surface_exists(surf_particles)
		{
			surface_free(surf_particles);
			surf_particles = -1;
		}
	}
}