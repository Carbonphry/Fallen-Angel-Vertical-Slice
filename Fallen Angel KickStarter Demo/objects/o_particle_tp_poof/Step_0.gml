if instance_exists(o_tp_projectile)
{
	part_emitter_region(part_system_, part_emitter_, o_player.x-5, o_player.x+5, o_player.y-5, o_player.y+5, ps_shape_ellipse, ps_distr_gaussian);

	part_emitter_burst(part_system_, part_emitter_, part_type_, 4);
} else
{
	instance_destroy();
}
