/// @description Attack State
image_speed = 0.8;

if !instance_exists(class_player)
{
	state_ = flameangel.idle;
	exit;
}

if animation_hit_frame(7)
{
	audio_play(a_flameangel_attack);
	var target = instance_nearest(x,y,class_player);
	var _direction = point_direction(x, y-30, target.x, target.y) + random_range(-10,10);
	var _projectile = instance_create_layer(x, y-30, "Solids", o_flameangel_projectile);
	_projectile.direction = _direction;
	_projectile.image_angle = _direction;
	_projectile.speed = 4;
	_projectile.z = id.z;
	
}
if animation_hit_frame(image_number -1)
{
	state_ = flameangel.run;
	//state_ = choose (flameangel.wander, flameangel.run);
	attacked_ = true;
	alarm[2] = random_range(3,4) * global.one_second;
	alarm[1] = 2*global.one_second;
}