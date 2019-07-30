/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
var spd = 1;

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


