draw_self();

draw_text_color(x+24, y+56, "P"+string(index+1), c_black, c_black, c_black, c_black, 1);

if(global.teams_mode){
	image_blend = global.p_colors[index+global.team_change_value[index]];
}
else{
	image_blend = c_white;
}