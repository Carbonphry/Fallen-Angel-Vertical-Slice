///@description FullScreen
// You can write your code in this editor
if ( alarm[0] > 0) then exit; 

fullscreen = !fullscreen;
alarm[0] = room_speed/2; 
window_set_fullscreen(fullscreen);
