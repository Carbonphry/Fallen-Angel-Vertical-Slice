/// @description Apply Knockback
// You can write your code in this editor
if alarm_get(7) and (state_ != tankangel.attack and state_ != tankangel.jump and state_ != tankangel.jump_atk and state_!= tankangel.die) {
	set_move_n(knockback_direction,knockback_ammount);
}