/// @description Throw Attack
// You can write your code in this editor
if image_index <= 1 {
	image_speed = 1.1;
} else if image_index >= 5 {
	image_speed = 2.5;
}

if animation_hit_frame(0) {
	switch global.gamepad_active {
		
		case false:
		direction_facing_ = round(point_direction(x, y, o_input.xdir_, o_input.ydir_)/90);
		break;
		
		case true:
		var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
		var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
		direction_facing_ = round(o_reticle.direction/90);
		break;
			
	}
	
	if direction_facing_ > 3
	{
		direction_facing_ = 0;
	}

	if direction_facing_ == 0 
	{
		image_xscale = 1;
	}
	if direction_facing_ == 2 
	{
		image_xscale = -1;
	}
}

if animation_hit_frame(0) {
	switch global.gamepad_active {
		
		case false:
		var _angle = point_direction(x, y, o_input.xdir_, o_input.ydir_);
		break;
		
		case true:
		var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
		var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
		var _angle = o_reticle.direction;//point_direction(0, 0, xaxis_, yaxis_);
		break;
			
	}
	var _life = 100;
	var _damage = 1;
	var _knockback = 0;
	switch direction_facing_ {
	
		case dir.up:
		var _hitbox = create_hitbox(s_whip_effect, x-1, y-18, _angle, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		break;
		
		case dir.down:
		var _hitbox = create_hitbox(s_whip_effect, x, y-2, _angle, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		break;
		
		case dir.right:
		var _hitbox = create_hitbox(s_whip_effect, x+6, y-10, _angle, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		break;
		
		case dir.left:
		var _hitbox = create_hitbox(s_whip_effect, x-6, y-10, _angle, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		break;
	
	}
	
	_hitbox.visible = true;
	_hitbox.image_speed = 3;
	_hitbox.lift = false;
	_hitbox.stun = true;
	_hitbox.depth = depth-1;
	_hitbox.image_index = 0;
} 