/// @description Land    
image_speed = .9;

/*
image_speed = 1.5;
move_movement_entity(true);
apply_friction_to_movement_entity();
var _parry_input = o_input2.action_three_pressed_;


if throwing_ == false
{
throwing_ = true;
direction_facing_ = round(point_direction(x, y, o_input2.xdir_, o_input2.ydir_)/90);
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

if marked_ == false
{
	if animation_hit_frame(2)
	{
		{
			var _angle = point_direction(x, y, o_input2.xdir_, o_input2.ydir_);
			set_movement(_angle, 2);
			var tp = instance_create_depth(x,y-10-z/4,-y-z, o_tp_projectile);
			tp.z = z;
		}
	}
	
	if instance_exists(o_tp_projectile) and o_tp_projectile.can_tp_== true
	{
		if _parry_input == true 
		{
			audio_play(a_teleport);
			create_animation_effect(s_tp_poof, x, y, 1.4, true);
			
			
			x = o_tp_projectile.x;
			y = o_tp_projectile.y+10;
			o_tp_projectile.destroy_ = true;
			state_ = starting_state_;
			throwing_ = false;
			create_animation_effect(s_tp_poof, x, y, 0.8, true);
			
		}
	}
}

if instance_exists(o_tp_mark) and marked_ = false
{
	marked_ = true;
	if _parry_input == true and marked_ = true
	{
		var _angle = 0;
		var _life = 3;
		var _damage = 1;
		var _knockback = 4;
		
		audio_play(a_teleport);
		create_animation_effect(s_tp_poof, x, y, 1.4, true);
		x = o_tp_mark.x;
		y = o_tp_mark.y+40;
		o_tp_mark.destroy_ = true;
		state_ = starting_state_
		throwing_ = false;
		create_animation_effect(s_tp_poof, x, y, 0.8, true);
		create_hitbox(s_tp_hitbox, o_player.x, o_player.y, _angle, _life, [o_enemy], _damage, _knockback);
		marked_ = false;
	}
}

if animation_hit_frame(image_number - 1)
{
		state_ = starting_state_
		throwing_ = false;
}

