event_inherited();

if(action == "Aim Down" && action_alarm > 0){
	draw_sprite_ext(Spr_Bow_Aim_Angles, 0, x, y-aim_height, image_xscale, image_yscale, 0, image_blend, image_alpha);
	draw_sprite_ext(Spr_Bow_Aim_Line, 0, x, y-aim_height, image_xscale, image_yscale, aim_dir*image_xscale, image_blend, image_alpha);
}
else if(action == "Aim Up" && action_alarm > 0){
	draw_sprite_ext(Spr_Bow_Aim_Angles, 0, x, y-aim_height, image_xscale, -image_yscale, 0, image_blend, image_alpha);
	draw_sprite_ext(Spr_Bow_Aim_Line, 0, x, y-aim_height, image_xscale, image_yscale, aim_dir*image_xscale, image_blend, image_alpha);
}