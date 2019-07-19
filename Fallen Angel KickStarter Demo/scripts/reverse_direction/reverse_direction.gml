//@description reverse_direction(direction,variable)
/// @param direction
/// @param variable
gml_pragma("forceinline");

if argument0 >= 0 and argument0 <= 180 {
		argument1 = argument0 + 180;
} else if argument0 > 180 and argument0 <= 360 {
		argument1 = argument0 -180;
} 

return argument1;