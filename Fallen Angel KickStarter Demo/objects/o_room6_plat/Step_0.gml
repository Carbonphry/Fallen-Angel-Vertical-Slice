/// @description Insert description here
// You can write your code in this editor


switch  o_button_plat.state {

	case 1:
	if  y >= 616 {
		y -=1;
		o_player.y -=1;
		o_player.state_ = player.not_playable;
		instance_deactivate_object(elevator_solid);
		instance_deactivate_object(elevator_solid_2);
		
	} else if y < 616 and o_player.state_ == player.not_playable {
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
	if  y <= 1006 {
		y +=1;
		o_player.y +=1;
		o_player.state_ = player.not_playable;
		instance_deactivate_object(elevator_solid);
		instance_deactivate_object(elevator_solid_2);
	} else if y > 1006 and o_player.state_ == player.not_playable {
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





