/// @description To white and destroy
// You can write your code in this editor
image_alpha += fadeSpeed;

if (image_alpha >= .9) {
	with instance_create_depth(o_level_tut_portal.x,o_level_tut_portal.y,0,o_door) {
		//instance_id = 
		switch room {
		
			case r_world:
			room_ = r_protodung;
			start_ = i_world_to_protodung;
			break;
			
			case r_protodung:
			room_ = r_garden2;
			start_ = toGarden2;
			break;
			
			case r_garden2:
			room_ = r_protodung;
			start_ = fromGardenToprot;
			break;
			
			case r_intro:
			room_ = r_room2;
			start_ = room1to2;
			break;
		
		}
		
		image_xscale *= 2.5;
		image_yscale *= 2.5;
	}
	instance_destroy();
}