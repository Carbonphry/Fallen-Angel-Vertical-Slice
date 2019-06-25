/// @description To white and destroy
// You can write your code in this editor
image_alpha += fadeSpeed;

if (image_alpha >= 1) {
	room_goto(r_ending);
	instance_destroy();
}