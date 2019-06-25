/// @description Fades and dies
// You can write your code in this editor
image_alpha -= fadeSpeed;

if (image_alpha <= 0) then instance_destroy();