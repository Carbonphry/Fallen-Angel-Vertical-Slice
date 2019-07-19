gml_pragma("forceinline");
if not instance_exists(class_player) exit;

var target = instance_nearest(x,y,class_player);
var _distance_to_player = point_distance(x, y, target.x, target.y);
var di = point_direction(x,y,target.x, target.y);
if _distance_to_player < 80 and  collision_line(x, y, x+lengthdir_x(_distance_to_player,di), y+lengthdir_y(_distance_to_player,di), o_solid, false, false) == noone {
	state_ = cherub.attack;
	image_index = 0;
	
}