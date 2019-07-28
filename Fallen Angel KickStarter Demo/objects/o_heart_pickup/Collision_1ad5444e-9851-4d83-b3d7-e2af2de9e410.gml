/// @description Add to inv
// You can write your code in this editor
if o_hud.core_count <3 {
	o_hud.core_count++;
	audio_play(a_collect_item);
} else {
	if global.player_health < global.player_max_health {
		audio_play(a_player_small_heal);
		global.player_health +=2;
	}
	if global.player_health > global.player_max_health {
		global.player_health = global.player_max_health;
	}
}

instance_destroy(id,true);