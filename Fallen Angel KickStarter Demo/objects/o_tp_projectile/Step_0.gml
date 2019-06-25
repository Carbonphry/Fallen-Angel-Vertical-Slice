var _throw_input = o_input.action_three_pressed_;

if destroy_ == true
{
	can_tp_ = false;
	sprite_index = s_tp_projectile_destroy;
	speed = 0;
	instance_destroy(o_particle_tp_projectile);
	if fail_sound_ = true
	{
		audio_play_sound(a_teleport_fail, 8, false);
		fail_sound_ = false;
	}
}

if place_meeting(x-10, y-10, o_solid_air) || place_meeting(x+10, y+10, o_solid_air)
{
	
	can_tp_ = false;
		sprite_index = s_tp_projectile;
	if _throw_input == true
	{
		destroy_ = true;
	}
} else
{
	can_tp_ = true;
		sprite_index = s_tp_projectile_tp;
	if _throw_input == true
	{
		mask_index = s_player_idle;
		if place_meeting(x-10, y-10, o_solid_air) || place_meeting(x+10, y+10, o_solid_air) {
			can_tp_ = false;
		} else {
			
			mask_index = s_tp_projectile;
			if destroy_ == false
			{
				can_tp_ = true;
			}
		}
	}
}


if (last_sprite != sprite_index) 
{
   image_index = 0;
   last_sprite = sprite_index;
}

if place_meeting(x, y, o_solid) and !place_meeting(x, y, o_solid_air) {
	speed = 0;
	destroy_ = true;
}