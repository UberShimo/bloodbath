draw_self();

if(global.picked_characters[0] == Obj_Batman){
	draw_text_transformed(x, y, "OH BABY!!!", 8, 8, 0);
}

draw_text(x, y, string(global.music_volume));