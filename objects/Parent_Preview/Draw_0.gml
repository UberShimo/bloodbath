// Draw bg
draw_set_alpha(bg_alpha);
draw_rectangle_color(x-64*image_xscale, y-64*image_yscale, x+64*image_xscale, y+64*image_yscale, bg_color, bg_color, bg_color, bg_color, false);
draw_set_alpha(1);

draw_self();

// Draw stats
if(!global.target_run_mode && !global.chaos_mode){
	draw_sprite_ext(stats, 0, x, y+128*image_yscale, image_xscale, image_yscale, 0, image_blend, 1);
}

// Draw frame
spr = frame;
color = global.p_colors[index+global.team_change_value[index]];

if(global.is_CPU[index]){
	spr = Spr_CPU_Portrait_Frame;
	if(!global.teams_mode){
		color = c_white;
	}
}

draw_sprite_ext(spr, 0, x, y, image_xscale, image_yscale, 0, color, 0.5);