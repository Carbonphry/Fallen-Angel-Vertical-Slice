/// @description Insert description here
// You can write your code in this editor
if sprite_index == s_door_appear {
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