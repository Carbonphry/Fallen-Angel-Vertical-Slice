/// @description Attack State
image_speed = 0.5;
sprite_index = s_missileangel_attack;

if !instance_exists(class_player)
{
	state_ = missangel.idle;
	exit;
}

if animation_hit_frame(2)
{
	create_animation_effect(s_missileangel_attack_effect ,x,y-46,0.8,true);
}

if animation_hit_frame(8)
{
	audio_play(a_flameangel_attack);
	var target = instance_nearest(x,y,class_player);
	var _direction = point_direction(x, y-z-15, target.x, target.y)// + random_range(-5,5);
	var _projectile = instance_create_layer(x, y-z-15, "Solids", o_missileangel_projectile);
	_projectile.direction = _direction;
	_projectile.image_angle = _direction;
	_projectile.speed = 10;
	_projectile.alarm[1] = global.one_second*3;
	_projectile.z = class_player.z;
	
}

if animation_hit_frame(10)
{
	audio_play(a_flameangel_attack);
	var target = instance_nearest(x,y,class_player);
	var _direction = point_direction(x, y, target.x, target.y) //+ random_range(-5,5);
	var _projectile = instance_create_layer(x, y-z-15, "Solids", o_missileangel_projectile);
	_projectile.direction = _direction;
	_projectile.image_angle = _direction;
	_projectile.speed = 10;
	_projectile.alarm[1] = global.one_second*3;
	_projectile.z = class_player.z;
	
}

if animation_hit_frame(12)
{
	audio_play(a_flameangel_attack);
	var target = instance_nearest(x,y,class_player);
	var _direction = point_direction(x, y, target.x, target.y) //+ random_range(-5,5);
	var _projectile = instance_create_layer(x, y-z-15, "Solids", o_missileangel_projectile);
	_projectile.direction = _direction;
	_projectile.image_angle = _direction;
	_projectile.speed = 10;
	_projectile.alarm[1] = global.one_second*3;
	_projectile.z = class_player.z;
	
}
