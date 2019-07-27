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

var _hitbox = instance_create_layer(_x, _y, "Solids",  o_trigger_projectile);

_hitbox.image_angle = _angle;
_hitbox.alarm[0] = _frames;
_hitbox.targets_ = _array;
_hitbox.damage_ = _damage;
_hitbox.knockback_ = _knockback;
_hitbox.z = id.z;
_hitbox.direction = _angle+random_range(-2,2);
_hitbox.speed = random_range(5,6);
_hitbox.depth = id.depth;
//_hitbox.visible = true;
_hitbox.image_speed =  random_range(1.2,1.4);

return _hitbox;
