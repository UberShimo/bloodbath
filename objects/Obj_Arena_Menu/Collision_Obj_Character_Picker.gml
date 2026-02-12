
if(other.d_pressed){
	global.arena_index += 1;
	if(global.arena_index > array_length(global.arena_list)-1){
		global.arena_index = 0;
	}
	spawn_effect(arrow_x, arrow_y+arrow_distance-12, 1, Eff_Triangle_Filled, 1, 0.1, c_white, arrow_scale, arrow_scale, 0.01, -90, -90, 0, depth-1);
}
if(other.u_pressed){
	global.arena_index -= 1;
	if(global.arena_index < 0){
		global.arena_index = array_length(global.arena_list)-1;
	}
	spawn_effect(arrow_x, arrow_y-arrow_distance, 1, Eff_Triangle_Filled, 1, 0.1, c_white, arrow_scale, arrow_scale, 0.01, 90, 90, 0, depth-1);
}
