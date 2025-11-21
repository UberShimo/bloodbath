spr = frame;
color = global.p_colors[index+global.team_change_value[index]];

if(global.is_CPU[index]){
	spr = Spr_CPU_Portrait_Frame;
	if(!global.teams_mode){
		color = c_white;
	}
}

draw_sprite_ext(spr, 0, x, y, image_xscale, image_yscale, 0, color, 0.5);
// Draw stats
draw_sprite_ext(stats, 0, x, y+128, image_xscale, image_yscale, 0, image_blend, 1);