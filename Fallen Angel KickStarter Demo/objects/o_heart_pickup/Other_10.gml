if not can_pickup_ exit;
instance_destroy();
global.player_health += 1;
if global.player_health > global.player_max_health
{
	global.player_health = global.player_max_health;
}

audio_play(a_collect_item);
