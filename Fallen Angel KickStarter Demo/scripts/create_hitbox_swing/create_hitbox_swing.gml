///@arg x
///@arg y
///@arg angle
///@arg frames
///@arg target_array
///@arg damage
///@arg knockback

var _x = argument0;
var _y = argument1;
var _angle = argument2;
var _frames = argument3;
var _array = argument4;
var _damage = argument5;
var _knockback = argument6;

var _hitbox = instance_create_layer(_x, _y, "Instances",  o_heavy_swing);

_hitbox.image_angle = _angle;
_hitbox.alarm[0] = _frames;
_hitbox.targets_ = _array;
_hitbox.damage_ = _damage;
_hitbox.knockback_ = _knockback;
_hitbox.z = id.z;
_hitbox.direction = _angle;
_hitbox.speed = 9;
_hitbox.depth = id.depth;
//_hitbox.visible = true;
_hitbox.image_speed = .8;

return _hitbox;
