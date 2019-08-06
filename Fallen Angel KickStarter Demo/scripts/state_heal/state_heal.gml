/// @description Heal
// You can write your code in this editor
if power_stance {
	image_speed = 1;
} else {
	image_speed = .6;
}
if animation_hit_frame(5) {
	add_screenshake(0.7,10);
	set_vibration(.4,.4,.15);
}
if animation_hit_frame(6) {
	global.player_health +=2;
	if global.player_health > global.player_max_health {
		global.player_health = global.player_max_health;
	}
	o_hud.core_count--;
}