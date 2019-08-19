///@description Knockback
if alarm_get(7)  and state_ != flameangel.fell and state_ != flameangel.die {
	set_move_n(knockback_direction,knockback_ammount);
}