event_inherited();
if other.z != z then exit; 

if activated_ = false
{
sprite_index = s_level_tut_warper_activated;
activated_ = true;
}
alarm[1] = 10;
//o_level_tut_portal_base.first_warp_ = true;
platform_activate = true;
alarm[2] = global.one_second*4;
add_screenshake(3,12);


if sound_ = true
{
audio_play_priority(a_warper_activate);
sound_ = false;
}
