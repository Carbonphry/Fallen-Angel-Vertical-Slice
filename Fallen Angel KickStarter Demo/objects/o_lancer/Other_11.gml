/// @description Idle state
image_speed = 0.4;
sprite_index = s_lancerangel_idle;
if alarm[1] <= 0 
{
	alarm[1] = random_range(2, 4) *game_get_speed(gamespeed_fps);
	state_ = lancer.wander;
	direction_ = random(360);
}
var target = instance_nearest(x,y,class_player);

if (distance_to_object(target) < aggro_range_ and alarm[2] <= 0)
{
		state_ = lancer.aggro;
}
