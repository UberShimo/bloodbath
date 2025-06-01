draw_self();

if(place_meeting(x, y, Obj_Menu_Picker)){
	draw_sprite_ext(Spr_Triangle, 0, x+spr_width/2-arrows_distance, y+spr_height/2, -arrow_scale, arrow_scale, 0, c_white, 1);
	draw_sprite_ext(Spr_Triangle, 0, x+spr_width/2+arrows_distance, y+spr_height/2, arrow_scale, arrow_scale, 0, c_white, 1);
	draw_text_transformed(x+spr_width, y, string(floor(global.music_volume*100))+"%", 1.5, 1.5, 0);
}