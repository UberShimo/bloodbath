
if(other.d_pressed){
	global.arena_index += 1;
	if(global.arena_index > array_length(global.arena_list)-1){
		global.arena_index = 0;
	}
}
if(other.u_pressed){
	global.arena_index -= 1;
	if(global.arena_index < 0){
		global.arena_index = array_length(global.arena_list)-1;
	}
}
