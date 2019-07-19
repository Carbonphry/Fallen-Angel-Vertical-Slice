part_system_=part_system_create();

part_emitter_=part_emitter_create(part_system_);

part_type_=part_type_create();
part_type_sprite(part_type_, s_smoke, true, false, true);
part_type_alpha3(part_type_, 0.1, 0.5, 0.1);

part_type_life(part_type_, game_get_speed(game_speed_fps)*0.05, game_get_speed(game_speed_fps)*0.15);
part_type_scale(part_type_, 1, 1);

image_speed = 0.2;

