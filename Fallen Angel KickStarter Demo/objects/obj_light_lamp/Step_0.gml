/// @description Custom

// Inherit the parent event
event_inherited();

//Custom
var cos_value = cos(current_time*0.00012 + xstart + ystart + random_range(-0.08,0.08));
if (cos_value > 0.972)
{
	visible = false;
}
else
{
	visible = true;
}