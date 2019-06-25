/// @description Insert description here
// You can write your code in this editor
//depth = o_player.depth+15;
/*if place_meeting(o_player.x,o_player.y,id) {
		trigger_ = true;
		//o_player.playable_ = false;
		alarm[0] = room_speed*2;
		if !instance_exists(o_fade_in) then instance_create_depth(0,0,100,o_fade_in);
}*/

//if !ev_collision then trigger_ = false;
/*with o_player {
	if place_meeting(x,y-z,other) {
		trigger_ = true;
		//o_player.playable_ = false;
		alarm[0] = room_speed*2;
		if !instance_exists(o_fade_in) then instance_create_depth(0,0,100,o_fade_in);
	}
}


/*
if place_meeting(x,y,o_player) and alarm[0]<=0 {
	instance_create_depth(0,0,-99999,o_fade_in);
	alarm[0] = room_speed*2;

} else if !place_meeting(x,y,o_player) and instance_exists(o_fade_in) {
	instance_destroy(o_fade_in,false);
	alarm[0] = -1;
}