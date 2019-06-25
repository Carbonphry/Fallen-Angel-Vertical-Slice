keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);

global.gamepad_active = false;
global.coop = false;
///Initialize global pad
global.pad[1] = noone;
global.pad[0] = noone;
global.ready[1] = false;
global.ready[0] = false;
//2 players
global.input[2] = noone;
global.input[1] = noone;
global.player[2] = noone;
global.player[1] = noone;

scr_input(global.pad[0]);

xaxis_ = noone;
yaxis_ = noone;