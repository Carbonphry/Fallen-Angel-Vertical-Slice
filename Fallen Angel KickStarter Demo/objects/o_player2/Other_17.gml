/// @description Heal
// You can write your code in this editor
image_speed = .6;
if animation_hit_frame(5) {
	add_screenshake(0.7,10);
	set_vibration(.4,.4,.15);
}
if animation_hit_frame(6) {
	global.player_health +=2;
	o_hud.core_count--;
}