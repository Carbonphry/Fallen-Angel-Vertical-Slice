var stick_time = global.one_second/10;

if paused_ {
	gamepad_set_vibration(0,0,0);
	window_set_cursor(cr_default);
	
	if o_input.up_pressed_ and o_input.alarm[0] <= 0
	{
	index_ = max(--index_, 0)
	o_input.alarm[0] = global.one_second*.15;
	}

	if o_input.down_pressed_ and o_input.alarm[0] <= 0
	{
	index_ = min(++index_, option_length_-1)
	o_input.alarm[0] = global.one_second*.15;
	}
	
	if !global.gamepad_active 
	{
	if (device_mouse_y_to_gui(0) >= 135 and device_mouse_y_to_gui(0)<= 165 ) and (device_mouse_x_to_gui(0) >= 180 and device_mouse_x_to_gui(0) <= 300 ) {
		index_ = pauseoptions.resume;	
	} else if (device_mouse_y_to_gui(0) >= 166 and device_mouse_y_to_gui(0)<= 195 ) and (device_mouse_x_to_gui(0) >= 180 and device_mouse_x_to_gui(0) <= 300 ) {
		index_ = pauseoptions.main_menu;	
	} else if (device_mouse_y_to_gui(0) >= 196 and device_mouse_y_to_gui(0)<= 225 ) and (device_mouse_x_to_gui(0) >= 180 and device_mouse_x_to_gui(0) <= 300 ) {
		index_ = pauseoptions.quit;	
	}
	
	}
	
	if o_input.select_
	{
	switch (index_)
	{
		case pauseoptions.resume:
		//show_debug_message("Continue");
		scr_unpause();
		break;
		
		case pauseoptions.main_menu:
		game_restart();
		break;
		/*case pauseoptions.new_game:
		room_goto(r_world); //Select to start at 
		//room_goto(r_protodung);
		break;*/
		/*case pauseoptions.continue_game:
		show_debug_message("Credits");
		break;*/
		case pauseoptions.quit:
		game_end();
		break;
	}
}
	
	
	/*var _array_size = array_length_1d(global.inventory);
	if o_input.right_pressed_ and !alarm[0]
	{
		item_index_ = min(item_index_ + 1, _array_size - 1);;
		audio_play(a_menu_move);
		alarm[0] = stick_time;
	}
	if o_input.left_pressed_ and !alarm[0]
	{
		item_index_ = max(item_index_ - 1, 0);;
		audio_play(a_menu_move);
		alarm[0] = stick_time;
	}
	if o_input.action_three_pressed_
	{
		global.item[0] = global.inventory[item_index_];
		audio_play(a_menu_select);
		
	}
	if o_input.action_one_pressed_
	{
		global.item[1] = global.inventory[item_index_];
		audio_play(a_menu_select);
		
	}
	
	//Save
	if global.sigil
	{
		global.item[1] = global.inventory[item_index_];
		//audio_play(a_menu_select);
		
	}*/
	
}

if o_input.pause_pressed_ {
	
	if instance_exists(o_player) {
	
		if (o_player.state_ != player.not_playable and o_player.state_ != player.dead)  and !paused_
		{
		paused_ = true;
		paused_sprite_ = sprite_create_from_surface(application_surface, 0 , 0, view_wport[0], view_hport[0], false, false, 0, 0);
		instance_deactivate_all(true)
		/*var _array_size = array_length_1d(global.inventory);
		for (var _i=0; _i<_array_size; _i++) {
			instance_activate_object(global.inventory[_i]);
		}*/	
		instance_activate_object(o_game);
		instance_activate_object(o_input);
		audio_play(a_pause)
		}
	}
}

if global.freeze == 1 {
	freeze_sprite_ = sprite_create_from_surface(application_surface, 0 , 0, view_wport[0], view_hport[0], false, false, 0, 0);
	instance_deactivate_all(true);
	instance_activate_object(o_game);
	instance_activate_object(o_input);
}

if global.freeze > 0 {
	global.freeze++;
}

if global.freeze == 8 {
	if sprite_exists(freeze_sprite_) {
		sprite_delete(freeze_sprite_)
	}
	instance_activate_all();

	if instance_exists(block_fight) and !instance_exists(o_abdiel) {
		instance_deactivate_object(block_fight);
	} 
	if !instance_exists(o_abdiel) {
		instance_deactivate_object(camera_boss);
	}
	global.freeze = 0;
}