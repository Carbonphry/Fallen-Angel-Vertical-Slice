/// @description Insert description here
// You can write your code in this editor
if other.sprite_index != s_chargeattack_hitbox then exit;

if state == 1 {
	state = 2;
	add_screenshake(10,15);
	image_index = 0;
}