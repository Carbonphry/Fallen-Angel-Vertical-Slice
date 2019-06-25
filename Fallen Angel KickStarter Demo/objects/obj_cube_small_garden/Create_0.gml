if (!audio_is_playing(a_cube_appear)) {
	audio_play(a_cube_appear);
}

// This is required in all objects that have height and can be walked on if the player is high enough. 
height = 48;
image_speed = .9;
depth = -y;
alarm_set(0,global.one_second*4);
