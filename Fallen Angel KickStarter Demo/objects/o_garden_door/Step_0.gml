/// @description Insert description here
// You can write your code in this editor
if image_index < 6 {
	o_player.state_ = player.not_playable;
	o_player.direction_facing_ = dir.down;
	class_player.visible = false;
} else {
	class_player.visible = true;
	class_player.depth = depth-1;
}

if image_index == 11 {
	o_player.state_ = o_player.starting_state_;
}

if image_index >= 11 {
	image_alpha -= .1;
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