max_speed_ = 5;
image_speed = 0.8;
image_angle = point_direction(o_player.x, o_player.y, o_reticle.x, o_reticle.y);

move_towards_point(o_reticle.x, o_reticle.y-6, max_speed_);

instance_create_layer(x, y, "Effects", o_particle_tp_projectile)

alarm[0] = global.one_second * 1;

destroy_ = false;
can_tp_ = true;
fail_sound_ = true;
hit_sound_ = true;

last_sprite = sprite_index;

//depth = -y-10;

z = o_player.z;

depth = o_player.depth;