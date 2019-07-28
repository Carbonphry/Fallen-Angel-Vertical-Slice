/// @description Attack State
sprite_index = s_caveman_attack;
if image_index >= 2 and image_index <= 6  {
	parriable = true;
} else {
	parriable = false;
}
//move_movement_entity(true);
apply_friction_to_movement_entity();

if image_index < 4 {
	
	if !instance_exists(class_player) then exit;
	var tar = instance_nearest(x,y,class_player);
	
	if x<tar.x {
		image_xscale = 1;
	} else {
		image_xscale = -1;
	}

}

if animation_hit_frame(5)
{
	var target = instance_nearest(x,y,class_player);
	var _distance_to_player = point_distance(x, y, target.x, target.y);
	var di = point_direction(x,y,target.x, target.y);
	if collision_line(x, y, x+lengthdir_x(_distance_to_player,di), y+lengthdir_y(_distance_to_player,di), o_solid, false, false) == noone {
		_attack_angle = point_direction(x, y, target.x, target.y);
	} else {
		state_ = choose (cherub.run, cherub.idle); 
		stop = true;
		_attack_angle = noone;
		hit = false;
		alarm[1] = 1*global.one_second;
		alarm[2] = 1*global.one_second;
	}
	var _attack_direction = round(point_direction(x, y,  target.x, target.y)/90);
	//set_movement(_attack_angle, 20);
	if _attack_direction > 3
	{
		_attack_direction = 0;
	}

	if _attack_direction == 0 
	{
		image_xscale = 1;
	}
	if _attack_direction == 2 
	{
		image_xscale = -1;
	}

	audio_play_sound(a_cherub_attack, 5, false);
	stop = false;
}

if !stop {
	//set_move_n(_attack_angle, 3);
	/*x += lengthdir_x(2,_attack_angle);
	y += lengthdir_y(2,_attack_angle);*/
	//move_movement_entity(true);
	//add_movement_maxspeed(_attack_angle, 0.1, 1);
	enemy_dash(true,_attack_angle,2);
}

if place_meeting(x,y,class_player) {
	stop = true;
	image_speed = 1.2;
	hit = true;
} else {
	image_speed = 0.9;
}

if animation_hit_frame(8)
{
	var _damage = 1;
	var _knockback = 2;
	var _life = 4;
	var hitbox = create_hitbox(s_hitbox_caveman, x, y, _attack_angle, _life, [class_player], _damage, _knockback);
	hitbox.image_xscale = image_xscale;
	stop = true;
	
}

if image_index >= 10 and hit {
	image_speed = 0.8;
	x += lengthdir_x(2,_attack_angle-180);
	y += lengthdir_y(2,_attack_angle-180);
}

if animation_hit_frame(image_number-1)
{
	//state_ = cherub.idle; 
	//state_ = cherub.fallback; 
	state_ = cherub.run; 
	stop = true;
	_attack_angle = noone;
	hit = false;
	alarm[1] = 1*global.one_second;
	alarm[2] = 1*global.one_second;
	/*if image_xscale == -1 {
	image_xscale = 1;
	} else {
		image_xscale = -1;
	}*/
}