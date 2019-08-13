/// @description To white and destroy
// You can write your code in this editor
image_alpha += fadeSpeed;

if (image_alpha >= 1) {
	instance_deactivate_all(true);
	instance_activate_object(o_input);
	instance_activate_object(o_player);
	if o_input.respawn_ {
	//audio_stop_all();
	if room == r_gabriel_ancientcity_room2 {
		global.player_start_position = GA_2_RESTART;
	} else {
		global.player_start_position = o_start_position;
	}
	//global.coop = noone;
	//global.destroyed = noone;
	//global.font = noone;
	//global.gamepad_active = noone;
	//global.inventory = noone;

	//global.i = noone;
	//global.one_second = noone;
	//global.player_gems = noone;
	global.player_health = global.player_max_health;
	global.player_stamina = global.player_max_stamina;
	instance_activate_all();
	room_restart();//room_goto(global.current_stage);
	if room == r_gabriel_ancientcity_room2 {
		global.elevator_restart = true;
	}
	}
}