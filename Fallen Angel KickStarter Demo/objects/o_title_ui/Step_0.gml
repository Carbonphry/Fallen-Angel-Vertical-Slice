if alpha <=.8 then exit;

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
if (device_mouse_y_to_gui(0) >= 165 and device_mouse_y_to_gui(0)<= 195 ) and (device_mouse_x_to_gui(0) >= 180 and device_mouse_x_to_gui(0) <= 300 ) {
		index_ = options.new_game;	
} else if (device_mouse_y_to_gui(0) >= 196 and device_mouse_y_to_gui(0)<= 225 ) and (device_mouse_x_to_gui(0) >= 180 and device_mouse_x_to_gui(0) <= 300 ) {
		index_ = options.continue_game;	
} else if (device_mouse_y_to_gui(0) >= 226 and device_mouse_y_to_gui(0)<= 265 ) and (device_mouse_x_to_gui(0) >= 180 and device_mouse_x_to_gui(0) <= 300 ) {
		index_ = options.quit;	
}
}



if o_input.select_
{
	switch (index_)
	{
		/*case options.continue_game_game:
			show_debug_message("Continue");
			break;*/
		case options.new_game:
			room_goto(r_intro_room1); //Select to start at 
			//room_goto(r_protodung);
			break;
		case options.continue_game:
			/*global.coop = true;
			room_goto(r_intro_room1);*/
			//show_debug_message("Credits");
			break;
		case options.quit:
			game_end();
			break;
	}
}

