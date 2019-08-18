/// @description Apply Knockback
// You can write your code in this editor
if alarm_get(7) and (state_ != lancer.attack and state_ != lancer.attack2 and state_ != lancer.die) {
	set_move_n(knockback_direction,knockback_ammount);
}
