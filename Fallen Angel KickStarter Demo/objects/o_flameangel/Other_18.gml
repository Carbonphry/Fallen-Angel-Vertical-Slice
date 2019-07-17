/// @description Explosion
// You can write your code in this editor
image_speed = .8;
sprite_index = s_flameangel_explode;
uninterruptible = true;

if image_index >= 5 and image_index <= 8 {
	parriable = true;
} else {
	parriable = false;
}


if animation_hit_frame(3) {
audio_play(a_flameangel_explode);
}

if animation_hit_frame(11) {
	var _damage = 3;
	var _knockback = 4;
	var _life = 1;
	create_hitbox_knockback(s_flameangel_explode_collision, x, y, 0, _life, [class_player], _damage, _knockback);
	add_screenshake(4,15)
}

if animation_hit_frame(image_number-1) {
	state_ = flameangel.idle;
	alarm[3] = global.one_second*3;
	uninterruptible = false;
}
