///@description set the image_scale of a given light collider
///@param id
///@param image_xscale
///@param image_yscale

	with(argument0)
	{
		//Set
		image_xscale = argument1;
		image_yscale = argument2;
		
		//Define
		scr_define_corners();
		
		//Update
		scr_update_corners();
	}