/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

var spd = 1;

switch global.garden_elevator {

	case false:
	if place_meeting(x,y,o_player) {
		y -=spd;
		o_player.y -=spd;
		o_player.state_ = player.not_playable;

	}

	if y <=60 and !instance_exists(o_transition) {
		instance_create_depth(x,y,-9999,o_transition);
	}
	break;
	
	case true:
	
	
	if y < 208 {
		y +=spd;
		o_player.y +=spd;
		o_player.state_ = player.not_playable;
	} else {
		if !boo {
			boo = true;
			o_player.state_ = o_player.starting_state_;
			alarm_set(0,global.one_second*3);
		}
	}
	
	break;

}
/*if  y >= 550 {
		y -=spd;
		o_player.y -=spd;
		o_player.state_ = player.not_playable;
		instance_deactivate_object(elevator_solid);
		instance_deactivate_object(elevator_solid_2);
		
		
	} else if y < 550 and o_player.state_ == player.not_playable {
		o_player.state_ = player.idle;
		instance_activate_object(elevator_solid);
		instance_activate_object(elevator_solid_2);
		depth = -251;
		
		
	}
	
	
}
/*
switch  o_button_plat.state {

	case 1:
	if  y >= 550 {
		y -=spd;
		o_player.y -=spd;
		o_player.state_ = player.not_playable;
		instance_deactivate_object(elevator_solid);
		instance_deactivate_object(elevator_solid_2);
		
		
	} else if y < 550 and o_player.state_ == player.not_playable {
		o_player.state_ = player.idle;
		instance_activate_object(elevator_solid);
		instance_activate_object(elevator_solid_2);
		depth = -251;
		
		
	}
	
	if y < 900 {
		depth = -251;
	}
	break;
	
	case 2:
	if  y <= 988 {
		y +=spd;
		o_player.y +=spd;
		o_player.state_ = player.not_playable;
		instance_deactivate_object(elevator_solid);
		instance_deactivate_object(elevator_solid_2);
	} else if y > 988 and o_player.state_ == player.not_playable {
		o_player.state_ = player.idle;
		instance_activate_object(elevator_solid);
		instance_activate_object(elevator_solid_2);
		depth = 999;
	} 
	
	if y > 900 {
		depth = 999;
	}
	break;
}


