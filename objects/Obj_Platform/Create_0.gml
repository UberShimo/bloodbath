image = global.wall_images[global.BG_index];

#region Outline variables
width = 32;
height = 32;
x_offset = width/2;
y_offset = height/2;
outline_color = c_white;

// Check where to draw
draw_above = true;

// Just for extra none white trippin
if(Obj_BG.BG == BG_Trippy){
	draw_above = false;
}
#endregion