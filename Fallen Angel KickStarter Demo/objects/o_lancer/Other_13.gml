/// @description Aggro State
image_speed = .6;
sprite_index = s_lancerangel_move;
var target = instance_nearest(x,y,class_player);
direction_ = point_direction(x, y, target.x, target.y);
var _x_speed = lengthdir_x(_speed_, direction_);
if _x_speed != 0
{
		image_xscale = sign(_x_speed);
}

if alarm[1] <= 0
{
		apply_friction_to_movement_entity();
} 
else
{
	add_movement_maxspeed(direction_, 0.001, 0.001);
	mp_potential_step_object(target.x, target.y, .7, class_enemy_coll);
}

//move_movement_entity(true);

if _speed_ == 0
{
	alarm[1] = random_range(1, 3) * global.one_second;
	state_ = lancer.idle;
}
if ( global.player_health>0 ) and distance_to_object(target) < 25
{
	if not instance_exists(o_player) exit;
	
	//state_ = lancer.attack;
	state_ = choose (lancer.attack, lancer.attack, lancer.attack, lancer.attack2);
	image_index = 0;
	var _distance_to_player = point_distance(x, y, target.x, target.y);

} else if ( global.player_health <= 0 ) {
	state_ = lancer.wander;
}

