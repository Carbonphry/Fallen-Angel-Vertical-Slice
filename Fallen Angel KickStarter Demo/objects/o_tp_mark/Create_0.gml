image_speed = 0.8;
alarm[0] = global.one_second * 5;
sprite_index = s_tp_projectile_marked_start;
enemy_marked_ = false;
destroy_ = false;
enemy_id_ = other.id;
mark_count = 0;

if(instance_number(o_tp_mark) >= 2)
{
   instance_destroy()
}

depth = -y-2000;

last_sprite = sprite_index;

audio_play_sound(a_teleport_marked, 8, true);