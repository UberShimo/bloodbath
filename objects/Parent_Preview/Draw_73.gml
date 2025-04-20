spr = frame;
color = global.p_colors[index];

if(global.is_CPU[index]){
	spr = Spr_CPU_Portrait_Frame;
	color = c_white;
}

draw_sprite_ext(spr, 0, x, y, image_xscale, image_yscale, 0, color, 0.5);