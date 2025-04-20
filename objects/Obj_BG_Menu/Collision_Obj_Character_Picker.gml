
if(other.d_pressed){
	global.BG_index += 1;
	if(global.BG_index > array_length(global.BG_list)-1){
		global.BG_index = 0;
	}
}
if(other.u_pressed){
	global.BG_index -= 1;
	if(global.BG_index < 0){
		global.BG_index = array_length(global.BG_list)-1;
	}
}
