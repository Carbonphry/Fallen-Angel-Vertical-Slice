/// @description Check if no enemies
// You can write your code in this editor
if !instance_exists(o_enemy) and spawn and alarm[1] <= 0 {
	event_user(0);
	spawn = false;
	alarm[0] = room_speed*2;
}