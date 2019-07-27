/// @description Attack State
if image_index >= 6 and image_index <= 10 {
	parriable = true;
} else {
	parriable = false;
}
/*move_movement_entity(true);*/
apply_friction_to_movement_entity();

if animation_hit_frame(1) {
	image_speed = .8;	
}


if animation_hit_frame(8) {
	
	var target = instance_nearest(x,y,class_player);
	var _attack_angle = point_direction(x, y, target.x, target.y);
	var _attack_direction = round(point_direction(x, y,  target.x, target.y)/90);
	
	set_movement(_attack_angle, 6);

	if _attack_direction > 3 then _attack_direction = 0;
	
	if _attack_direction == 0 then image_xscale = 1;
	
	if _attack_direction == 2 then image_xscale = -1;

	audio_play_sound(a_tankangel_attack, 5, false);
}

if animation_hit_frame(12) {
	var _damage = 2;
	var _knockback = 4;
	var _life = 1;
	//create_hitbox(s_tankangel_hitbox, x, y-8, 0, _life, [o_player], _damage, _knockback);
	
	create_hitbox_knockback(s_tankangel_hitbox, x, y-8, 0, _life, [class_player], _damage, _knockback);
	//instance_create_layer(x,y, "Solids", o_knockback_hitbox);
	add_screenshake(4,15);
	image_speed = 1;
}
if image_index = image_number {
	state_ = tankangel.idle;
	alarm[1] = 1*global.one_second;
}