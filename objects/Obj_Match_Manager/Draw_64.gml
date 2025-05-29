if(!global.chaos_mode){
	if(instance_exists(players[0])){
		p1_ui_hp = players[0].HP/players[0].max_HP;
		p1_ui_meter = players[0].meter/players[0].max_meter;
		p1_ui_hearts = players[0].hearts;
	}
	
	corner_offset = 4*ui_pixel_size;
	x_line = 32*ui_pixel_size+corner_offset;
	// HP frame
	draw_sprite_ext(Spr_HP_Bar, 0, x_line, 2*ui_pixel_size+corner_offset, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_HP_Bar, 1, x_line, 2*ui_pixel_size+corner_offset, ui_pixel_size*p1_ui_hp, ui_pixel_size, 0, c_white, 1);
	// Meter frame
	draw_sprite_ext(Spr_Meter_Bar, 1, x_line, 34*ui_pixel_size+corner_offset, ui_pixel_size*p1_ui_meter, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_Meter_Bar, 0, x_line, 34*ui_pixel_size+corner_offset, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	// Hearts
	for(i = 0; i < p1_ui_hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x_line-16*ui_pixel_size+32*i*ui_pixel_size*heart_size, 66*ui_pixel_size+corner_offset, ui_pixel_size*heart_size, ui_pixel_size*heart_size, 0, c_white, 1);
	}
	
	if(instance_exists(players[1])){
		p2_ui_hp = players[1].HP/players[1].max_HP;
		p2_ui_meter = players[1].meter/players[1].max_meter;
		p2_ui_hearts = players[1].hearts;
	}
	
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

// Play winner animation...
if(play_winner_animation){
	draw_sprite_ext(Spr_Winner, winner_image, x_draw_winner_animation, y_draw_winner_animation, ui_pixel_size*2, ui_pixel_size*2, 0, c_white, 1);
}
if(play_winner_splash){
	draw_sprite_ext(Spr_Winner_Effect, winner_splash_image, x_draw_winner_animation, y_draw_winner_animation, ui_pixel_size*2, ui_pixel_size*2, 0, winner_color, 1);
}