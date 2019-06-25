//sprite_index = s_player_run_right;
gml_pragma("forceinline");
image_speed = .5;
var tar = instance_nearest(x,y,o_target);

move_towards_point(tar.x,tar.y,1);

if place_meeting(x,y,o_target) {
	instance_create_depth(0,0,9999,o_transition);
	speed = 0;
	state_ = starting_state_;
}