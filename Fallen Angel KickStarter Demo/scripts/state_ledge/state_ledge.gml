gml_pragma("forceinline");
image_speed = .6;

switch led_dir {

case dir.up:
#region Ledge Up

switch ledge_state {
	
	case 1:
	sprite_index = s_player_ledge_up_on;
	break;
	
	case 2:
	
	var spdl = .2;
	var led = instance_nearest(x,y,ledge_up);
	
	if o_input.right_ {
		if x < led.right_ { 
			x+=spdl;
			sprite_index = s_player_ledge_up_move_right;
		}
	} else if o_input.left_  {
		if  x > led.left_ {
			x-=spdl;
			sprite_index = s_player_ledge_up_move_left;
		}
	} else {
		sprite_index = s_player_ledge_up;
	}


	if o_input.action_two_ {
		ledge_state = 3;
		image_index = 0;
	}

	if o_input.down_ {
		ledge_state = 4;
		image_index = 0;
	
	}
	break;
	
	case 3:
	sprite_index = s_player_ledge_up_off;
	//o_input.up_ = true;
	break;
	
	case 4:
	sprite_index = s_player_ledge_up_out;
	break;
}








#endregion
break;

case dir.right:
#region Ledge Right

switch ledge_state {
	
	case 1:
	sprite_index = s_player_ledge_right_on;
	break;
	
	case 2:
	
	var spdl = .2;
	var led = instance_nearest(x,y,ledge_right);

	if o_input.up_ {
		if y > led.up_ { 
			y-=spdl;
			sprite_index = s_player_ledge_right_move_up;
		}
	} else if o_input.down_ {
		if y < led.bottom_ { 
			y+=spdl;
			sprite_index = s_player_ledge_right_move_down;
		}
	} else {
		sprite_index = s_player_ledge_right;
	}


	if  o_input.action_two_ {
		ledge_state = 3;
		image_index = 0;
	}

	if o_input.left_ {
		ledge_state = 4;
		image_index = 0;
	
	}
	break;
	
	case 3:
	sprite_index = s_player_ledge_right_off;
	
	break;
	
	case 4:
	sprite_index = s_player_ledge_right_out;
	break;
}





#endregion
break;

case dir.left:
#region Ledge Left
image_xscale = 1;
switch ledge_state {
	
	case 1:
	sprite_index = s_player_ledge_left_on;
	//sprite_index = s_player_ledge_right_on;
	break;
	
	case 2:
	
	var spdl = .2;
	var led = instance_nearest(x,y,ledge_left);

	if o_input.up_ {
		if y > led.up_ { 
			y-=spdl;
			sprite_index = s_player_ledge_left_move_up;
		}
	} else if o_input.down_  {
		if y < led.bottom_ { 
			y+=spdl;
			sprite_index = s_player_ledge_left_move_up;
		}
	} else {
		sprite_index = s_player_ledge_left;
	}


	if  o_input.action_two_ {
		ledge_state = 3;
		image_index = 0;
	}

	if o_input.right_ {
		ledge_state = 4;
		image_index = 0;
	
	}
	break;
	
	case 3:
	sprite_index = s_player_ledge_left_off;
	
	break;
	
	case 4:
	sprite_index = s_player_ledge_left_out;
	break;
}





#endregion
break;

case dir.down:
#region Ledge Down
depth = 950;
switch ledge_state {
	
	case 1:
	sprite_index = s_player_ledge_down_on;
	break;
	
	case 2:
	
	var spdl = .2;
	var led = instance_nearest(x,y,ledge_down);

	if o_input.right_ {
		/*if place_meeting(x+spdl,y-z,ledge_coll) {
			x+=spdl;
			sprite_index = s_player_ledge_down_move_left;
		}*/
		
		if x < led.right_ {
			x+=spdl;
			sprite_index = s_player_ledge_down_move_left;
		}
	} else if o_input.left_  {
		if x > led.left_ { 
			x-=spdl;
			sprite_index = s_player_ledge_down_move_right;
		}
	} else {
		sprite_index = s_player_ledge_down;
	}


	if o_input.action_two_ {
		ledge_state = 3;
		image_index = 0;
	}

	if o_input.down_ {
		ledge_state = 4;
		image_index = 0;
	
	}
	break;
	
	case 3:
	sprite_index = s_player_ledge_down_off;
	//o_input.up_ = true;
	break;
	
	case 4:
	sprite_index = s_player_ledge_down_out;
	break;
}






#endregion
break;

}