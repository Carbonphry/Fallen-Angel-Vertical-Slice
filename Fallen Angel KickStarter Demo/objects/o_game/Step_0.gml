/// @description Volume control and inv check
// You can write your code in this editor
//var margin = 50;
//window_mouse_set(clamp(window_mouse_get_x(), margin, window_get_width()-margin), clamp(window_mouse_get_y(), 0+margin, window_get_height()-margin));

if keyboard_check(vk_add) {
   if vol < 1 vol += 0.05;
   audio_master_gain(vol);
   show_volume = true;
   alarm[1] = room_speed*.25;
}

if keyboard_check(vk_subtract) {
   if vol > 0 vol -= 0.05;
   audio_master_gain(vol);
   show_volume = true;
   alarm[1] = room_speed*.25;
}

if instance_exists(o_player) {
	if global.sigil then o_player.sigil_equipped_ = true;
}

