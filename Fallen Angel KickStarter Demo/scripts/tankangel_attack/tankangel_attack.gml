gml_pragma("forceinline");
if not instance_exists(class_player) exit;
var target = instance_nearest(x,y,class_player);
var _distance_to_player = point_distance(x, y, target.x, target.y)
if _distance_to_player < 30 
{
	state_ = tankangel.attack;
	image_index = 0;
	sprite_index = s_tankangel_attack;
}