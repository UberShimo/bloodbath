width = 32;
height = 32;
x_offset = 0;
y_offset = 0;
collision_check_distance = 34;
outline_color = c_white;

// Outline variables
outline_above = false;
outline_below = false;
outline_right = false;
outline_left = false;

check_where_to_draw_outline = function(){
	if(!place_meeting(x, y-collision_check_distance, Parent_Collision) && y-collision_check_distance > 0){
		outline_above = true;
	}
	if(!place_meeting(x, y+collision_check_distance, Parent_Collision) && y+collision_check_distance < room_height){
		outline_below = true;
	}
	if(!place_meeting(x+collision_check_distance, y, Parent_Collision) && x+collision_check_distance < room_width){
		outline_right = true;
	}
	if(!place_meeting(x-collision_check_distance, y, Parent_Collision) && x-collision_check_distance > 0){
		outline_left = true;
	}

	// Just for extra none white trippin
	if(Obj_BG.BG == BG_Trippy){
		outline_above = false;
		outline_below = false;
		outline_right = false;
		outline_left = false;
	}
}