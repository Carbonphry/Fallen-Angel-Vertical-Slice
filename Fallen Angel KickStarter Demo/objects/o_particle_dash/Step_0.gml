part_system_depth(part_system_, o_player.depth);
part_emitter_region(part_system_, part_emitter_, o_player.x-5, o_player.x+5, o_player.y-15-o_player.z, o_player.y-o_player.z,
	ps_shape_line, ps_distr_linear);

part_emitter_burst(part_system_, part_emitter_, part_type_, 4);

