gml_pragma("forceinline");
if o_input.action_two_ {
	if o_input.alarm[8] <=0 {
			o_input.alarm[8] = global.one_second*.15;
	}
} else {
		o_input.alarm[8] = global.one_second*.15;
}
	
if o_input.alarm[8] == 1 { 
	o_input.alarm[8] = -1;
	var jump = o_input.action_two_;
} else { 
	if z<=z_ground then var jump = false;
}
	
if z>z_ground  {
	var jump = o_input.action_two_;
}

return jump;