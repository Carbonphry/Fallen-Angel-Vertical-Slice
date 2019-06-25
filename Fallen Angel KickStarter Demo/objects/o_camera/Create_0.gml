target_ = o_player;
width_ = camera_get_view_width(view_camera[0]); 
height_ = camera_get_view_height(view_camera[0]); 
scale_ = view_wport[0] / width_ ;

screenshake_ = 0

instance_create_layer(x,y, "Instances", o_parallax);

y_lock = false;
x_lock = false;
xy_lock = false;