var _sprite = choose(s_blood_burst_1, s_blood_burst_2, s_blood_burst_3, s_blood_burst_4);
image_speed = 0.8;
sprite_index = _sprite;
image_blend = c_red;
motion_set(random(360), 0.2);
depth = -y-11;

alarm[0] = 5;