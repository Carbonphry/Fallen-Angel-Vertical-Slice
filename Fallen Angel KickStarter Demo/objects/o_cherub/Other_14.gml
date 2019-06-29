/// @description Attack State

//move_movement_entity(true);
apply_friction_to_movement_entity();

if image_index < 5 {
	
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
	x += lengthdir_x(2,_attack_angle);
	y += lengthdir_y(2,_attack_angle);
}

if place_meeting(x,y,class_player) {
	stop = true;
	image_speed = 1.2;
	hit = true;
} else {
	image_speed = 0.8;
}

if animation_hit_frame(9)
{
	var _damage = 1;
	var _knockback = 4;
	var _life = 4;
	create_hitbox(s_cherub_hitbox, x, y-8, _attack_angle, _life, [class_player], _damage, _knockback);
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
	state_ = choose (cherub.run, cherub.idle); 
	stop = true;
	_attack_angle = noone;
	hit = false;
	alarm[1] = 1*global.one_second;
	alarm[2] = 1*global.one_second;
	
	
	
}