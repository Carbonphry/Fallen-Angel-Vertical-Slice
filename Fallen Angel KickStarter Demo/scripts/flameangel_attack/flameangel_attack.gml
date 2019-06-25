gml_pragma("forceinline");
if not instance_exists(class_player) exit;
var target = instance_nearest(x,y,class_player);
var _distance_to_player = point_distance(x, y, target.x, target.y)
if _distance_to_player < 25 and alarm[3] <= 0 
{
	state_ = flameangel.explosion;
	image_index = 0;
	sprite_index = s_flameangel_explode;
} else if _distance_to_player < 60 and alarm[2] <= 0
{
	state_ = flameangel.attack;
	image_index = 0;
	sprite_index = s_flameangel_attack;
}