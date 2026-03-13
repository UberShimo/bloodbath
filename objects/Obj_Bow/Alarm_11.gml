event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		rb_hold = true;
		if(irandom_range(0, 1)){ // 50%
			y_pressed = buffer_duration;
			y_hold = true;
			// How long to hold?
			alarm[11] = random_range(24, generate_sprite_frames(Spr_Bow_Spearthrow_startup));
		}
		else{
			x_pressed = buffer_duration;
		}
	}
	// Boomerang
	else if(rng < 0.2){ // 20%
		down_forward_pressed = buffer_duration;
		
		if(irandom_range(0, 1)){ // 50% angled throw
			if(y < closest_enemy.y){
				x_pressed = buffer_duration;
			}
			else{
				b_pressed = buffer_duration;
			}
		}
		else{
			y_pressed = buffer_duration;
		}
		// Hold?
		if(irandom_range(0, 1)){ // 50%
			x_hold = true;
			y_hold = true;
			b_hold = true;
		}
		else{
			x_hold = false;
			y_hold = false;
			b_hold = false;
		}
	}
	// Shoot arrow
	else if(rng < 0.4){ // 20%
		diagonal_input_hold = true;
		if(irandom_range(1, 3) < 3){ // 66%
			x_pressed = buffer_duration;
			x_hold = true;
		}
		else{
			y_pressed = buffer_duration;
			y_hold = true;
		}
		
		// How long to hold?
		alarm[11] = random_range(1, generate_sprite_frames(Spr_Bow_Aim_Down_startup));
	}
	// Crosspin
	else if(rng < 0.5){ // 10%
		diagonal_input_hold = true;
		b_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		rb_hold = true;
		b_pressed = buffer_duration;
	}
}
