
if(other.d_pressed){
	global.BG_index += 1;
	if(global.BG_index > array_length(global.BG_list)-1){
		global.BG_index = 0;
	}
	spawn_effect(arrow_middle, y+arrow_distance, 1, Eff_Triangle_Filled, 1, 0.1, c_white, arrow_scale, arrow_scale, 0.01, -90, -90, 0, depth-1);
}
if(other.u_pressed){
	global.BG_index -= 1;
	if(global.BG_index < 0){
		global.BG_index = array_length(global.BG_list)-1;
	}
	spawn_effect(arrow_middle, y-arrow_distance, 1, Eff_Triangle_Filled, 1, 0.1, c_white, arrow_scale, arrow_scale, 0.01, 90, 90, 0, depth-1);
}
