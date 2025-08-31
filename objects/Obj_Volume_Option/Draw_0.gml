draw_self();

if(place_meeting(x, y, Obj_Menu_Picker)){
	draw_sprite_ext(Spr_Triangle, 0, x+spr_width/2-arrows_distance, y+spr_height/2, -arrow_scale, arrow_scale, 0, c_white, 1);
	draw_sprite_ext(Spr_Triangle, 0, x+spr_width/2+arrows_distance, y+spr_height/2, arrow_scale, arrow_scale, 0, c_white, 1);
	volume = floor(global.music_volume*400); // * 400 cuz mac volume = 0.25
	if(volume < 0){
		volume = 0;
	}
	draw_text_transformed(x+spr_width, y, string(volume)+"%", 1.5, 1.5, 0);
}