sprite_index = s_level_tut_portal;
audio_play_loop(a_portal_ambient);
if shake_ = true
{
add_screenshake(6,15);
shake_ = false;
} else
{
	add_screenshake(1,30);
}