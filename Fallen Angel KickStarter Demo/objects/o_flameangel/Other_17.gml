/// @description Run
image_speed = .8;
sprite_index = s_flameangel_move;

var target = instance_nearest(x,y,class_player);

direction_ = point_direction(target.x, target.y, x, y); 
/*var addx = lengthdir_x(.5,direction_ );
var addy = lengthdir_y(.5,direction_ );*/

if place_meeting(x,y,o_solid) then state_ = flameangel.aggro;

if alarm[1] <= 0
{
	apply_friction_to_movement_entity();
	state_ = flameangel.idle;
} else 
{
	add_movement_maxspeed(direction_, 0.1, 1);
	//mp_potential_step_object(x+addx, y+addy, 1, o_solid);
}


move_movement_entity(true);