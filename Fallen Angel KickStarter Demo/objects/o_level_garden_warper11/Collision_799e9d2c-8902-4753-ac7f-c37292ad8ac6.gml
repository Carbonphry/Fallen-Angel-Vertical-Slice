event_inherited();
if !global.puzzle_state_ then exit;

if other.z != z then exit; 

o_level_proto_portal_base.first_warp_ = true;

if activated_ = false
{
sprite_index = s_level_tut_warper_activated;
activated_ = true;
}
alarm[1] = 10;
//o_level_tut_portal_base.first_warp_ = true;
platform_activate = true;
alarm[2] = global.one_second*6;
add_screenshake(3,12);


if sound_ = true
{
audio_play_priority(a_warper_activate);
sound_ = false;
}