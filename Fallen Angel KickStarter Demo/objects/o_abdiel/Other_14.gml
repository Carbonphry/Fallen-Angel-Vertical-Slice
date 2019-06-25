/// @description Attack State
sprite_index = s_abdiel_swordattack;


/*move_movement_entity(true);
apply_friction_to_movement_entity();*/
if animation_hit_frame(0) {
	image_speed = 0.5;
}

if animation_hit_frame(4) 
{
	var target = instance_nearest(x,y,class_player);
	var _attack_angle = point_direction(x, y, target.x, target.y);
	var _attack_direction = round(point_direction(x, y,  target.x, target.y)/90);
	set_movement(_attack_angle, 3);	

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

	audio_play(a_abdiel_melee);
}

if animation_hit_frame(5)
{
	
	/*var _attack_angle = point_direction(x, y, o_player.x, o_player.y);
	var _attack_direction = round(point_direction(x, y,  o_player.x, o_player.y)/90);*/
	
	//set_movement(_attack_angle, 3);
	//add_movement_maxspeed(_attack_angle, 2, 7);
	var target = instance_nearest(x,y,class_player);
	var _attack_angle = point_direction(x, y, target.x, target.y);
	var _attack_direction = round(point_direction(x, y,  target.x, target.y)/90);
	
	//DMG Obj
	var _damage = 1;
	var _knockback = 0;
	var _life = 1;
	var hit = create_hitbox_knockback(s_abdiel_hitbox, x, y-8, _attack_angle, _life, [class_player], _damage, _knockback);
	//instance_create_layer(x,y, "Instances", o_knockback_hitbox);
	hit.z = class_player.z;
	uninterruptible = true;
	image_speed = 0.8;
}

if animation_hit_frame(image_number-1)
{
	//state_ = cherub.idle; 
	speed_ = 0;
	uninterruptible = false;
	state_ = abdiel.idle; //choose(abdiel.wander, abdiel.idle, abdiel.run, abdiel.warp); 
	//state_ = choose (lancer.run, lancer.idle); 
	
	alarm[1] = 1*global.one_second;
	alarm[2] = 2*global.one_second;
	alarm[3] = 45;
	
}