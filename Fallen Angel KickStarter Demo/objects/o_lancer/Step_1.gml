/// @description Apply Knockback
// You can write your code in this editor
if alarm_get(7) and (state_ != lancer.attack or state_ != lancer.attack2) {
	set_move_n(knockback_direction,knockback_ammount);
}
