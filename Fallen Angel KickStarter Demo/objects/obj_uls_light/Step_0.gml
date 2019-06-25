/// @description Light Animation
switch id {
	
	case lpuz1:
	if o_puzzle_1.facenu != 0 {
		visible = false;
	} else {
		visible = true;
	}
	break;
	
	case lpuz2:
	if o_puzzle_2.facenu != 1 {
		visible = false;
	} else {
		visible = true;
	}
	break;
	
	case lpuz3:
	if o_puzzle_3.facenu != 2 {
		visible = false;
	} else {
		visible = true;
	}
	break;
	
	default:
	visible = true;
	break;
}

	//Check
	if (light_animation)
	{
		//Animation
		scr_light_animation();
	}