/// @description Apply Knockback
// You can write your code in this editor
if alarm_get(7) and (state_ != tankangel.attack or state_ != tankangel.jump  or state_ != tankangel.jump_atk) {
	set_move_n(knockback_direction,knockback_ammount);
}