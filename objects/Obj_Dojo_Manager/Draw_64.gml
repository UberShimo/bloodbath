event_inherited();

// Dummy UI
if(dummy != noone){
	p2_ui_hp = dummy.HP/dummy.max_HP;
	p2_ui_meter = dummy.meter/dummy.max_meter;
	p2_ui_hearts = 1;
	x_line = display_get_gui_width()-32*ui_pixel_size-corner_offset;
	// HP frame
	draw_sprite_ext(Spr_HP_Bar, 0, x_line-2*ui_pixel_size, 2*ui_pixel_size+corner_offset, -ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_HP_Bar, 1, x_line-2*ui_pixel_size, 2*ui_pixel_size+corner_offset, -ui_pixel_size*p2_ui_hp, ui_pixel_size, 0, c_white, 1);
	// Meter frame
	draw_sprite_ext(Spr_Meter_Bar, 1, x_line, 34*ui_pixel_size+corner_offset, -ui_pixel_size*p2_ui_meter, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_Meter_Bar, 0, x_line, 34*ui_pixel_size+corner_offset, -ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	// Hearts
	for(i = 0; i < p2_ui_hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x_line+16*ui_pixel_size-32*i*ui_pixel_size*heart_size, 66*ui_pixel_size+corner_offset, ui_pixel_size*heart_size, ui_pixel_size*heart_size, 0, c_white, 1);
	}
}