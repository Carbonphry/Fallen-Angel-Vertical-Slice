/// @description To white and destroy
// You can write your code in this editor
image_alpha += fadeSpeed;

if (image_alpha >= 1.3) {
	with instance_create_depth(o_player.x,o_player.y,0,o_door) {
		//instance_id = 
		switch room {
		
			
			
			case r_intro_room1:
			room_ = r_intro_room2;
			start_ = room1to2;
			break;
			
			case r_intro_room2:
			if distance_to_object(back2) < 50 {
				room_ = r_intro_room1;
				start_ =  backtoIntro;
			} else {
				room_ = r_intro_room3;
				start_ = room2to3;
			}
			break;
			
			case r_intro_room3:
			if distance_to_object(back3) < 90 {
				room_ = r_intro_room2;
				start_ = backtoroom2;
			} else {
				room_ = r_intro_room3_2;
				start_ = room3to3_2;
			}
			break;
			
			case r_intro_room3_2:
			if distance_to_object(back3_2) < 90 {
				room_ = r_intro_room3;
				start_ =  backtoroom3;
			} else {
				room_ = r_intro_room4;
				start_ = room3to4;
			}
			break;
			
			case r_intro_room4:
			if distance_to_object(back4) < 50 {
				room_ = r_intro_room3_2;
				start_ =  backtoroom3_2;
			} else {
				room_ = r_intro_room5;
				start_ = room4to5;
			}
			break;
			
			case r_intro_room5:
			if distance_to_object(back5) < 50 {
				room_ = r_intro_room4;
				start_ =  backtoroom4;
			} else {
				room_ = r_intro_room6;
				start_ = room5to6;
			}
			break;
			
			case r_intro_room6:
			if distance_to_object(back6) < 50 {
				room_ = r_intro_room5;
				start_ = backtoroom5;
			} else {
				room_ = r_intro_room7;
				start_ = room6to7;
			}
			break;
		}
		
		image_xscale *= 2.5;
		image_yscale *= 2.5;
	}
	instance_destroy();
}