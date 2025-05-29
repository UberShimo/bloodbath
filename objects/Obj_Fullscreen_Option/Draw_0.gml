draw_self();

if(place_meeting(x, y, Obj_Menu_Picker)){
	draw_set_alpha(0.5);
	if(window_get_fullscreen()){
		draw_set_alpha(1);
	}
	draw_rectangle(x+spr_width+4, y+y_offset-28, x+spr_width+100, y+y_offset+28, 2);

	draw_set_alpha(0.5);
	if(!window_get_fullscreen()){
		draw_set_alpha(1);
	}
	draw_rectangle(x+spr_width+24, y+y_offset-12, x+spr_width+80, y+y_offset+12, 2);

	draw_set_alpha(1);
}