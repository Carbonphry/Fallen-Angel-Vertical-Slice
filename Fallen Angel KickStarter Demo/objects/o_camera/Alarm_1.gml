/// @description Camera Fix
// You can write your code in this editor
if not instance_exists(target_) exit;
x = target_.x
y = target_.y-8

camera_set_view_speed(view_camera[0],-1,-1);