if distance_to_object(o_player) < 60
{
	image_alpha += 0.01
}

if image_alpha >= 0.8
{
	image_alpha = 0.8
}


switch (global.gamepad_active) {

	case true:
	sprite_index = s_tutorial_smash_gpad;
	break;
	
	case false:
	sprite_index = s_tutorial_smash;
	break;

}
