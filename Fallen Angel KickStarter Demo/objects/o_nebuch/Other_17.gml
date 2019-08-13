/// @description Run State
image_speed = .6;
sprite_index = s_nebuch_move;

if !instance_exists(class_player) then exit;
	var tar = instance_nearest(x,y,class_player);
	
	if x<tar.x {
		image_xscale = 1;
	} else {
		image_xscale = -1;
	}


var target = instance_nearest(x,y,class_player);
direction_ = point_direction(target.x,target.y, x, y); 


if alarm[1] <= 0
{
	apply_friction_to_movement_entity();
	state_ = cherub.idle;
} else 
{
	enemy_dash(true,direction_,1);
}


//move_movement_entity(true);
//alarm[1] = random_range(2, 3)*game_get_speed(game_speed_fps);
