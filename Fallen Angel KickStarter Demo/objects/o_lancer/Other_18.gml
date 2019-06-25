/// @description Attack State 2
sprite_index = s_lancerangel_attack2;
image_speed = 0.7;
//move_movement_entity(true);
apply_friction_to_movement_entity();
var target = instance_nearest(x,y,class_player);
if animation_hit_frame(8) or animation_hit_frame(16)
{
	
	var _attack_angle = point_direction(x, y, target.x, target.y);
	var _attack_direction = round(point_direction(x, y,  target.x, target.y)/90);
	
	set_move_n(_attack_angle, 8);
	//set_movement(_attack_angle, 4);


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
	
	//DMG Obj
	var _damage = 1;
	var _knockback = 0;
	var _life = 1;
	create_hitbox(s_lancer_hitbox, x, y-8, _attack_angle, _life, [class_player], _damage, _knockback);
	uninterruptible = true;
}

if animation_hit_frame(23)
{
	
	var _attack_angle = point_direction(x, y, target.x, target.y);
	var _attack_direction = round(point_direction(x, y,  target.x, target.y)/90);
	
	set_move_n(_attack_angle, 8);
	//set_movement(_attack_angle, 4);


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
	
	//DMG Obj
	var _damage = 1;
	var _knockback = 4;
	var _life = 1;
	create_hitbox(s_lancer_hitbox, x, y-8, _attack_angle, _life, [class_player], _damage, _knockback);
}


if animation_hit_frame(image_number-1)
{
	//state_ = cherub.idle; 
	uninterruptible = false;
	state_ = lancer.run; 
	//state_ = choose (lancer.run, lancer.idle); 
	alarm[1] = 1*global.one_second;
	alarm[2] = 1*global.one_second;
	
}
