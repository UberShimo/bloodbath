collision_check_distance = 34;
width = 32;
height = 32;
x_offset = width/2;
y_offset = height/2;
color = c_black;

// Check where to draw
draw_above = false;
draw_below = false;
draw_right = false;
draw_left = false;
if(!place_meeting(x, y-collision_check_distance, Parent_Collision)){
	draw_above = true;
}
if(!place_meeting(x, y+collision_check_distance, Parent_Collision)){
	draw_below = true;
}
if(!place_meeting(x+collision_check_distance, y, Parent_Collision)){
	draw_right = true;
}
if(!place_meeting(x-collision_check_distance, y, Parent_Collision)){
	draw_left = true;
}