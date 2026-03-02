// Parallax BG baby!
room_center = room_width/2;
half_cam_width = Obj_Match_Camera.camera_width/2;
cam_center_x = Obj_Match_Camera.camera_x + half_cam_width;
parallax_amount = (cam_center_x-room_center) * parallax_adjuster;
parallax_descreaser = parallax_amount/4;

draw_sprite(BG, 0, room_center + parallax_amount, 0);
if(BG != BG_Trippy){ // Dont draw too much when tripping!
	parallax_amount -= parallax_descreaser;
	draw_sprite(BG, 1, room_center + parallax_amount, 0);
	parallax_amount -= parallax_descreaser;
	draw_sprite(BG, 2, room_center + parallax_amount, 0);
	parallax_amount -= parallax_descreaser;
	draw_sprite(BG, 3, room_center + parallax_amount, 0);
}

if(BG != BG_Trippy){ // No darkness when trippin
	draw_set_alpha(global.BG_darkness);
	draw_sprite(BG_Black, 0, room_center, 0);
	draw_set_alpha(1);
}