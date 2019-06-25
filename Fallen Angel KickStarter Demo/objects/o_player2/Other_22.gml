/// @description Dead State


//if (image_index == 0 ) then image_speed = 0.2;
image_speed = 0.4;

global.player_health = 0;
if !instance_exists(o_fade_death) {
	instance_create_depth(0,0,-9998,o_fade_death); 
}

if animation_hit_frame(11) {
	image_speed = 0;
}

/*
if o_input.action_one_pressed_ {
	global.player_start_position = o_start_position;
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
	room_restart();//room_goto(global.current_stage);
}