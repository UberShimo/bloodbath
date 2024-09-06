
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

if(is_projectile){
	draw_sprite(Spr_Projectile_Symbol, 0, x+32*10, y+32*3);
}
if(!is_parryable){
	draw_sprite(Spr_Unparryable_Symbol, 0, x+32*11, y+32*3);
}
if(is_cancelable){
	draw_sprite(Spr_Cancelable_Symbol, 0, x+32*12, y+32*3);
}
else if(is_final){
	draw_sprite(Spr_Final_Symbol, 0, x+32*13, y+32*3);
}
// Not final or cancelable then show combo window
else{
	c_window = hit_stun-recovery+global.cancelable_recovery_frames;
	
	draw_text(x+32*8+digit_offset, y+32*3+digit_offset, string(c_window));
}
if(meter_cost > 0){
	draw_text(x+32*14+digit_offset-2, y+32*3+digit_offset, string(meter_cost));
	draw_sprite(Spr_Metercost_Symbol, 0, x+32*15, y+32*3);
}
