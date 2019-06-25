/// @description Insert description here
// You can write your code in this editor
//add_movement_maxspeed(point_direction(other.x,other.y,x,y), acceleration_, max_speed_);
//motion_add(point_direction(other.x,other.y,x,y),0.5);
/*if (state_ != player.sword or  state_ != player.sword2 or state_ != player.sword3 or state_ != player.evade ) and alarm[6] <= 0 {
	var _direction = point_direction(other.x, other.y, x, y);
	set_movement(_direction,1.5);
	state_ = player.enemy_coll;
	alarm[6] = global.one_second*.3;
}