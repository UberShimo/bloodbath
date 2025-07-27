if(!global.chaos_mode){
	if(instance_exists(players[0])){
		p1_ui_hp = players[0].HP/players[0].max_HP;
		p1_ui_meter = players[0].meter/players[0].max_meter;
		p1_ui_hearts = players[0].hearts;
		p1_ui_face = players[0].face;
		p1_ui_face_index = players[0].face_index;
	}
	else{
		p1_ui_hp = 0;
		p1_ui_meter = 0;
		p1_ui_hearts = 0;
	}
	
	corner_offset = 4*ui_pixel_size;
	x_line = 48*ui_pixel_size+corner_offset;
	y_line = 2*ui_pixel_size+corner_offset;
	// HP frame
	draw_sprite_ext(Spr_HP_Bar, 0, x_line, y_line, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_HP_Bar, 1, x_line, y_line, ui_pixel_size*p1_ui_hp, ui_pixel_size, 0, c_white, 1);
	// Meter frame
	draw_sprite_ext(Spr_Meter_Bar, 1, x_line+meter_frame_x*ui_pixel_size, y_line+30*ui_pixel_size, ui_pixel_size*p1_ui_meter, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_Meter_Bar, 0, x_line+meter_frame_x*ui_pixel_size, y_line+30*ui_pixel_size, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	// Hearts
	for(i = 0; i < p1_ui_hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x_line+hearts_x*ui_pixel_size+hearts_distance*i*ui_pixel_size*heart_size, y_line+hearts_y*ui_pixel_size, ui_pixel_size*heart_size, ui_pixel_size*heart_size, 0, c_white, 1);
	}
	// Face
	draw_sprite_ext(p1_ui_face, p1_ui_face_index, x_line-22*ui_pixel_size, y_line+22*ui_pixel_size, ui_pixel_size*face_size, ui_pixel_size*face_size, 0, c_white, 1);
	
	if(instance_exists(players[1])){
		p2_ui_hp = players[1].HP/players[1].max_HP;
		p2_ui_meter = players[1].meter/players[1].max_meter;
		p2_ui_hearts = players[1].hearts;
		p2_ui_face = players[1].face;
		p2_ui_face_index = players[1].face_index;
	}
	else{
		p2_ui_hp = 0;
		p2_ui_meter = 0;
		p2_ui_hearts = 0;
	}
	
	x_line = display_get_gui_width()-48*ui_pixel_size-corner_offset;
	// HP frame
	draw_sprite_ext(Spr_HP_Bar, 0, x_line-2*ui_pixel_size, y_line, -ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_HP_Bar, 1, x_line-2*ui_pixel_size, y_line, -ui_pixel_size*p2_ui_hp, ui_pixel_size, 0, c_white, 1);
	// Meter frame
	draw_sprite_ext(Spr_Meter_Bar, 1, x_line-meter_frame_x*ui_pixel_size, y_line+30*ui_pixel_size, -ui_pixel_size*p2_ui_meter, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_Meter_Bar, 0, x_line-meter_frame_x*ui_pixel_size, y_line+30*ui_pixel_size, -ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	// Hearts
	for(i = 0; i < p2_ui_hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x_line-hearts_x*ui_pixel_size-hearts_distance*i*ui_pixel_size*heart_size, y_line+hearts_y*ui_pixel_size, ui_pixel_size*heart_size, ui_pixel_size*heart_size, 0, c_white, 1);
	}
	// Face
	draw_sprite_ext(p2_ui_face, p2_ui_face_index, x_line+22*ui_pixel_size, y_line+22*ui_pixel_size, -ui_pixel_size*face_size, ui_pixel_size*face_size, 0, c_white, 1);
}

// Play winner animation...
if(play_winner_animation){
	scale = 1.6;
	draw_sprite_ext(Spr_Winner, winner_image, x_screen_center, y_screen_center, ui_pixel_size*scale, ui_pixel_size*scale, 0, c_white, 1);
}
if(play_winner_splash){
	scale = 1.8;
	draw_sprite_ext(Spr_Winner_Effect, winner_splash_image, x_screen_center, y_screen_center, ui_pixel_size*scale, ui_pixel_size*scale, 0, winner_color, 1);
}