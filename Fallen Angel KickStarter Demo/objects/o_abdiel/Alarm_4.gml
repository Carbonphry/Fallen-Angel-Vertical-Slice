/// @description Second Projectile
audio_play(a_abdiel_projectile);
var target = instance_nearest(x,y,class_player);
var _direction = point_direction(x, y, target.x, target.y) + random_range(-10,10);
var _projectile = instance_create_layer(x, y-32, "Solids", o_abdiel_projectile);

_projectile.direction = _direction;
_projectile.image_angle = _direction;
_projectile.speed = 4;