


switch (global.gamepad_active) {

	case true:
	draw_sprite_ext(s_tutorial_demonmode_gpad,image_index,o_pride_meter.x + 30,o_pride_meter.y + 80,1,1,0,c_white,1);
	image_speed = 0.6;
	break;
	
	case false:
	draw_sprite_ext(s_tutorial_demonmode,image_index,o_pride_meter.x + 30,o_pride_meter.y + 80,1,1,0,c_white,1);
	image_speed = 0.6;
	break;

}

