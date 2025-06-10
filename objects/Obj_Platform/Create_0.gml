image = global.wall_images[Obj_BG.index];

#region Outline variables
width = 32;
height = 32;
x_offset = 16;
y_offset = 16;
outline_color = c_white;

// Check where to draw
draw_above = true;

// Just for extra none white trippin
if(Obj_BG.BG == BG_Trippy){
	draw_above = false;
}
#endregion