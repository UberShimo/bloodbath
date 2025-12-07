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
			alarm[11] = random_range(1, generate_sprite_frames(Spr_Bow_Spearthrow_startup)+8);
		}
		else{
			x_pressed = buffer_duration;
			// How long to hold?
			alarm[11] = random_range(40, 120);
		}
	}
	// Boomerang
	else if(rng < 0.2){ // 20%
		down_forward_pressed = buffer_duration;
		x_pressed = buffer_duration;
		
		if(irandom_range(0, 1)){ // 50%
			if(y < closest_enemy.y){
				down_hold = true;
			}
			else{
				up_hold = true;
			}
		}
	}
	// Shoot arrow
	else if(rng < 0.4){ // 20%
		if(irandom_range(0, 1)){ // 50%
			down_forward_pressed = buffer_duration;
		}
		else{
			forward_down_pressed = buffer_duration;
		}
		y_pressed = buffer_duration;
		y_hold = true;
		
		// How long to hold?
		alarm[11] = random_range(1, generate_sprite_frames(Spr_Bow_Aim_Down_startup));
	}
	// Crosspin
	else if(rng < 0.5){ // 10%
		down_forward_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		rb_hold = true;
		b_pressed = buffer_duration;
	}
}
