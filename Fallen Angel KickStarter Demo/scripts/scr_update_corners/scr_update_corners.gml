///@description Update the values inside a light collider
///scr_update_corners()

	//Iterate
	var i_array;
	for (var i = 0; i < 4; ++i) 
	{
	    //Array get
		i_array = corners[i];
		
		//Set positions
		i_array[0] = x + lengthdir_x( i_array[2], i_array[3] + image_angle);
		i_array[1] = y + lengthdir_y( i_array[2], i_array[3] + image_angle);
		
		//Set
		corners[i] = i_array;
	}