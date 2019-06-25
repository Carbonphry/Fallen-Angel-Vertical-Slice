/// @description Insert description here
// You can write your code in this editor
//room_goto_next();

trigger_ = true;
//o_player.playable_ = false;
alarm[0] = room_speed*2;
if !instance_exists(o_transition) then instance_create_depth(0,0,100,o_transition);



