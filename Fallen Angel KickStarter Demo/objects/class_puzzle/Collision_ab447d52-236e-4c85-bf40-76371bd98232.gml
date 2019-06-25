/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,o_shield) then exit;

if global.puzzle_state_ == 1 then exit;

if alarm[0] < 0 {
	alarm[0] = room_speed*.75;
	//face = choose(0,1,2);//Random
switch (facenu) {
	
case 0:
facenu = 1;
break;

case 1:
facenu = 2;
break;

case 2:
facenu = 0;
break;

}


//state = 1;
sprite_index = s_level_protodung_puzzle_change;
image_speed = 2;
audio_play_priority(a_warper_activate);

}