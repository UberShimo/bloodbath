// Parallax BG baby!
parallax_amount = (Obj_Match_Camera.camera_x+(Obj_Match_Camera.camera_width/2)-room_width/2)*parallax_adjuster;
parallax_descreaser = parallax_amount/4;
draw_sprite(BG, 0, parallax_amount, 0);
if(BG != BG_Trippy){ // Dont draw too much when tripping!
	parallax_amount -= parallax_descreaser;
	draw_sprite(BG, 1, parallax_amount, 0);
	parallax_amount -= parallax_descreaser;
	draw_sprite(BG, 2, parallax_amount, 0);
	parallax_amount -= parallax_descreaser;
	draw_sprite(BG, 3, parallax_amount, 0);
}

if(BG != BG_Trippy){ // No darkness when trippin
	draw_set_alpha(global.BG_darkness);
	draw_sprite(BG_Black, 0, 0, 0);
	draw_set_alpha(1);
}