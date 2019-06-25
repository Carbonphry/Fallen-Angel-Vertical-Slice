if instance_exists(enemy_id_)
{
	if enemy_marked_ = true
	{
		x = enemy_id_.x;
		y = enemy_id_.y-36; 
	}
} else
{
	destroy_ = true;
}

if destroy_ == true
{
	sprite_index = s_tp_projectile_marked_end;
	audio_stop_sound(a_teleport_marked);
}

if (last_sprite != sprite_index) 
{
   image_index = 0;
   last_sprite = sprite_index;
}

