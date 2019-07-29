/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y+2,class_player) {
if sprite_index == s_door_open and image_index > 12 and !instance_exists(o_transition) {
	instance_create_depth(0,0,-99999,o_transition);
	o_player.state_ = player.not_playable;
}
}

/*if sprite_index == s_door_appear {
	if instance_exists(class_player) {
		class_player.visible = false;
		o_player.state_ = player.not_playable;
		o_player.direction_facing_ = dir.down;
	}
} else {
	if instance_exists(class_player) {
		class_player.visible = true;
	}
}