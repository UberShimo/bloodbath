event_inherited();

image = global.wall_images[Obj_BG.index];

#region Outline variables

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

// Just for extra none white trippin
if(Obj_BG.BG == BG_Trippy){
	draw_above = false;
	draw_below = false;
	draw_right = false;
	draw_left = false;
}
#endregion