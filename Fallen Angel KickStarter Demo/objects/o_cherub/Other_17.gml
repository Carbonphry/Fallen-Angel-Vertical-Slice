/// @description Run State
image_speed = .8;
sprite_index = s_cherub_move;

var target = instance_nearest(x,y,class_player);
direction_ = point_direction(target.x,target.y, x, y); 

if alarm[1] <= 0
{
	apply_friction_to_movement_entity();
	state_ = cherub.idle;
} else 
{
	add_movement_maxspeed(direction_, 0.2, 1);
}


move_movement_entity(true);
//alarm[1] = random_range(2, 3)*game_get_speed(game_speed_fps);
