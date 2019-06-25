///@arg intensity
///@arg duration

var _intensity = argument0;
var _duration = argument1;

if not instance_exists(o_camera) exit;

with (o_camera)
{
	screenshake_ = _intensity;
	alarm[0] = _duration;
}