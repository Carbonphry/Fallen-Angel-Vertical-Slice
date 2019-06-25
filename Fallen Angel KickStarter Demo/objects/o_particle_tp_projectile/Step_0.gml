if instance_exists(o_tp_projectile)
{
	part_emitter_region(part_system_, part_emitter_, o_tp_projectile.x, o_tp_projectile.x, o_tp_projectile.y, o_tp_projectile.y, ps_shape_line, ps_distr_linear);

	part_emitter_burst(part_system_, part_emitter_, part_type_, 4);
} else
{
	instance_destroy();
}
