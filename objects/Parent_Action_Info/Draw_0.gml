// Draw frame
if(show_info){
	// Set text bg
	draw_set_alpha(text_bg_alpha);
	draw_rectangle_color(x+192, y, x+sprite_width, y+128, text_bg_color, text_bg_color, text_bg_color, text_bg_color, false);
	draw_set_alpha(1);
	
	draw_self();
}

shader_set(Shd_Outline);
var texture = sprite_get_texture(sprite_index, image_index);
var t_width = texture_get_texel_width(texture);
var t_height = texture_get_texel_height(texture);
shader_set_uniform_f(texel_handle, t_width, t_height);
shader_set_uniform_f(outline_handle, outline_color[0]*image_alpha, outline_color[1]*image_alpha, outline_color[2]*image_alpha, outline_color[3]*image_alpha);

// Draw action image
draw_set_alpha(sprite_bg_alpha);
draw_rectangle_color(x, y, x+192, y+128, sprite_bg_color, sprite_bg_color, sprite_bg_color, sprite_bg_color, false);
draw_set_alpha(1);
draw_sprite(image, frame, x+96, y+64);
draw_sprite_ext(extra_image, 0, x+96+extra_image_x, y+64+extra_image_y, extra_image_scale, extra_image_scale, extra_image_rotation, extra_image_color, 1);

shader_reset();

// Draw left part of frame
draw_sprite(Spr_Action_Info_Frame_Left_Part, 0, x, y);

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
if(show_info){
	draw_text(x+32*6+digit_offset, y+digit_offset-4, info);
	draw_text(x+32+digit_offset, y+32*3+digit_offset, damage);
	draw_text(x+32+digit_offset, y+32*2+digit_offset, startup);
	draw_text(x+32*4+digit_offset, y+32*2+digit_offset, recovery);
	draw_text(x+32*4+digit_offset, y+32*3+digit_offset, hit_stun);
	if(!is_final){
		recovery_when_canceled = recovery-global.cancelable_recovery_frames;
		if(recovery_when_canceled < 0){
			recovery_when_canceled = 0;
		}
		draw_text_transformed(x+32*4+digit_offset, y+32*2+digit_offset+16, "(" + string(recovery_when_canceled) + ")", 0.75, 0.75, 0);
	}

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
		draw_text_color(x+32*12+digit_offset-10, y+32*3+digit_offset-2, string(meter_cost), c, c, c, c, 1);
		draw_sprite(Spr_Metercost_Symbol, meter_image, x+32*13, y+32*3);
	}
}