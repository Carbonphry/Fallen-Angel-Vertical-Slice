/// @description Run State
image_speed = .7;
sprite_index = s_lancerangel_move;
var target = instance_nearest(x,y,class_player);
direction_ = point_direction(target.x, target.y, x, y); 

if alarm[1] <= 0
{
	apply_friction_to_movement_entity();
	state_ = lancer.idle;
} else 
{
	add_movement_maxspeed(direction_, 0.05, .55);
}


move_movement_entity(true);
//alarm[1] = random_range(2, 3)*game_get_speed(gamespeed_fps);
