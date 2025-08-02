// Leave clone when dashing, must happen before inherit,
// check is identical to dash check except ground check
if(grounded && lb_pressed > 0 && (action == noone || check_for_cancel())
&& (forward_hold || backward_hold)){
	clone = instance_create_depth(x, y, 0, Obj_Katana_Clone);
	clone.initiate(self);
	clone.player_number = player_number;
	clone.outline_color = outline_color;
}

event_inherited();

// ACTION!

// Special clone creation
if(action == noone && meter >= 25 && rb_pressed && !half_circle_forward_pressed && (down_forward_pressed || down_backward_pressed || double_down_pressed)){
	if(down_backward_pressed){
		image_xscale *= -1;
	}
	meter -= 25;
	
	clone = instance_create_depth(x, y, 0, Obj_Katana_Clone);
	clone.HP = HP;
	clone.meter = meter;
	clone.index = index;
	clone.player_number = player_number;
	clone.hearts = hearts;
	clone.player_color = player_color;
	clone.outline_color = outline_color;
	clone.image_xscale = image_xscale;
	clone.sprite_index = Spr_Katana_Clone_Quickdraw_startup;
	clone.action_alarm = 90;
	clone.life_span = 0;
	clone.weight = 0;
	clone.shake_amount = 2;
	
	if(double_down_pressed){
		clone.action = "Teleport Spawner";
		clone.spawner = self;
	}
	else{
		clone.action = "Quickdraw";
	}
	reset_buffers();
}

if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		if(!grounded){
			action = "8F";
			sprite_index = Spr_Katana_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed || down_backward_pressed){
			send_clone_backward = false;
			action = "Send Clone";
			action_alarm = 1;
			
			if(down_backward_pressed){
				send_clone_backward = true;
			}
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Katana_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Katana_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Quickdraw";
			sprite_index = Spr_Katana_Quickdraw_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Katana_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Katana_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			grip = original_grip/2;
			sprite_index = Spr_Katana_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(!grounded){
			action = "8S";
			is_unstable = true;
			sprite_index = Spr_Katana_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(double_down_pressed){
			action = "Headsplitter";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Katana_Headsplitter_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed || down_backward_pressed){
			if(right_pressed){
				image_xscale = object_scale;
			}
			else{
				image_xscale = -object_scale;
			}
			action = "Sweep";
			
			h_velocity += 6*image_xscale;
			grip = 0;
			
			sprite_index = Spr_Katana_Sweep_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			shake_amount = launcher_shake_amount;
			sprite_index = Spr_Katana_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			can_cancel = true;
			sprite_index = Spr_Katana_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(meter >= 100 && (half_circle_forward_pressed || half_circle_backward_pressed)){
			if(half_circle_backward_pressed){
				image_xscale *= -1;
			}
			action = "ULTRA";
			meter -= 50;
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Katana_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.5;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
			audio_play_sound(Snd_Manly_Tensing, 0, false);
		}
	}	
	reset_buffers();
	
	if(doing_action_by_canceling){
		if(action == last_action){
			cancel_the_cancel();
		}
		else{
			do_cancel();
		}
	}
	// Gotta reset this shit
	doing_action_by_canceling = false;
}
