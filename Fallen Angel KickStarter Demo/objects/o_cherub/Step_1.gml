/// @description Apply Knockback
// You can write your code in this editor
if alarm_get(7) and (state_ != cherub.attack and state_ != cherub.die) {
	set_move_n(knockback_direction,knockback_ammount);
}