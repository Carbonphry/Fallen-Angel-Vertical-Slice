if global.puzzle_state_ == 1 then exit;

instance_create_layer(x, y, "Instances", o_level_protodung_portal_arrive);
instance_destroy();