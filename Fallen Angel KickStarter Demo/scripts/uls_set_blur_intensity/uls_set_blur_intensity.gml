///@description set the blur intensity of the shadows, this option should be in a range of 0 to 10. If set to zero, this will turn off the blur system improving performance.
///@param enable

with(obj_uls_controller)
{
	//Set 
	blur_effect_intensity = argument0;
	
	//Free
	if (argument0 == 0)
	{
		if (surface_exists(surf_aux_blur))
		{
			surface_free(surf_aux_blur);
		}
	}
}