/// @description Projectile Attack State 
sprite_index = s_abdiel_projectileattack;
image_speed = 0.7;
//move_movement_entity(true);
apply_friction_to_movement_entity();

if animation_hit_frame(5) {
	audio_play(a_abdiel_projectile);
	var target = instance_nearest(x,y,class_player);
	var _direction = point_direction(x, y-32, target.x, target.y) + random_range(-5,5);
	var _projectile = instance_create_layer(x, y-32, "Instances", o_abdiel_projectile);
	_projectile.direction = _direction;
	_projectile.image_angle = _direction;
	_projectile.speed = 4;
	_projectile.z = id.z;
	instance_create_layer(x,y-30, "Instances", o_glow_burst_small);
	var _abdiel_attack = choose(a_abdiel_voice_attack1, a_abdiel_voice_attack2);
	if !audio_is_playing(_abdiel_attack) {
	audio_play(_abdiel_attack);
	}
	
}

if animation_hit_frame(7) {
	audio_play(a_abdiel_projectile);
	var target = instance_nearest(x,y,class_player);
	var _direction = point_direction(x, y-32, target.x, target.y) + random_range(-5,5);
	var _projectile = instance_create_layer(x, y-32, "Instances", o_abdiel_projectile);
	_projectile.direction = _direction;
	_projectile.image_angle = _direction;
	_projectile.speed = 4;
	_projectile.z = id.z;
	round_++;
}

if animation_hit_frame(8)
{
	if (round_ == 4) {
	round_ = 0;
	state_ = choose(abdiel.idle,abdiel.idle,abdiel.idle,abdiel.warp);
	//state_ = choose (flameangel.wander, flameangel.run);
	//attacked_ = true;
	alarm[3] = random_range(3,5) * global.one_second;
	alarm[1] = 2*global.one_second;
	}
}

/*if animation_hit_frame(image_number -1)
{
	state_ = abdiel.run;
	//state_ = choose (flameangel.wander, flameangel.run);
	//attacked_ = true;
	alarm[2] = random_range(1,3) * global.one_second;
	alarm[1] = 2*global.one_second;
}