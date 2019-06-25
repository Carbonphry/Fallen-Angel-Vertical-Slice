/// @description Idle state
image_speed = 0.8;
sprite_index = s_abdiel_idle;
var target = instance_nearest(x,y,class_player);
if (distance_to_object(target) < aggro_range_ and alarm[2] <= 0) {
		state_ = abdiel.aggro;
} else if (distance_to_object(target) > aggro_range_) and (global.player_health >0) and alarm[3] <= 0 {
		state_ = abdiel.warp;
} else   {
	//alarm[1] = random_range(2, 4) *game_get_speed(gamespeed_fps);
	
	state_ = abdiel.wander;
	direction_ = point_direction(o_player.x,o_player.y,x,y);
}
