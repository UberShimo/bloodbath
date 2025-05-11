
// Draw input
if(air_only){
	draw_sprite(Spr_Air, 0, x+input_offset, y+input_offset);
}
else if(air_ok){
	draw_sprite(Spr_Air_OK, 0, x+input_offset, y+input_offset);
}
if((air_only || air_ok) && hold_ok){
	draw_sprite(Spr_Hold_OK, 0, x+input_offset+48, y+input_offset);
}
else if(hold_ok){
	draw_sprite(Spr_Hold_OK, 0, x+input_offset, y+input_offset);
}
draw_sprite(movement_input, 0, x+input_offset, y+input_offset);
draw_sprite(button_input, 0, x+input_offset, y+input_offset);

// Draw info
draw_text(x+32*6+digit_offset, y+digit_offset-4, info);
draw_text(x+32+digit_offset, y+32*3+digit_offset, damage);
draw_text(x+32+digit_offset, y+32*2+digit_offset, startup);
draw_text(x+32*4+digit_offset, y+32*2+digit_offset, recovery);
draw_text(x+32*4+digit_offset, y+32*3+digit_offset, hit_stun);

if(!is_parryable){
	draw_sprite(Spr_Unparryable_Symbol, 0, x+32*3, y+32*0);
}

if(is_cancelable){
	draw_sprite(Spr_Cancelable_Symbol, 0, x+32*7, y+32*3);
}
else if(is_final){
	draw_sprite(Spr_Final_Symbol, 0, x+32*7, y+32*3);
}
else{
	draw_sprite(Spr_HitCancelable_Symbol, 0, x+32*7, y+32*3);
}

if(meter_cost > 0){
	meter_image = floor(meter_cost/25);
	c = c_lime;
	draw_text_color(x+32*13+digit_offset-10, y+32*3+digit_offset-2, string(meter_cost), c, c, c, c, 1);
	draw_sprite(Spr_Metercost_Symbol, meter_image, x+32*14, y+32*3);
}
