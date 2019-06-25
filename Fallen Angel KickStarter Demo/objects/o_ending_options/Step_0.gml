/// @description Insert description here
// You can write your code in this editor
window_set_cursor(cr_default);
	
if o_input.left_pressed_ and o_input.alarm[0] <= 0
{
	index_ = !index_
	o_input.alarm[0] = room_speed*.15;
}

if o_input.right_pressed_ and o_input.alarm[0] <= 0
{
	index_ = !index_
	o_input.alarm[0] = room_speed*.15;
}
	
if !global.gamepad_active 
{
	if (mouse_y >= 140 and mouse_y <= 200 ) and (mouse_x >= 110 and mouse_x <= 230 ) {
		index_ = 0;	
	} else if (mouse_y >= 140 and mouse_y <= 200 ) and (mouse_x >= 245 and mouse_x <= 365) {
		index_ = 1;	
	} 
}

if o_input.select_
{
	switch (index_)
	{
		case 0:
		game_restart(); //Select to start at 
		break;
		
		case 1:
		game_end();
		break;
	}
}
