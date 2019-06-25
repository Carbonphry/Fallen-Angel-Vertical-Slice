/// @description Insert description here
// You can write your code in this editor
if sprite_index == s_level_garden_artifact_hit {
	sprite_index = s_level_garden_artifact_activated;
	o_level_garden_portal_base.first_warp_ = true;
	global.puzzle_state_ = 0;
}