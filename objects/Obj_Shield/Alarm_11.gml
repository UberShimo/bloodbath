event_inherited();
	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Meter clone
	if(meter >= 20 && irandom_range(1, 8) == 1){ // 12.5%
		rb_hold = true;
		if(irandom_range(0, 1)){ // 50%
			x_pressed = buffer_duration;
		}
		else{
			y_pressed = buffer_duration;
		}
	}
	// Pose
	else if(rng < 0.1){ // 10%
		down_forward_pressed = buffer_duration;
		rng = irandom_range(1, 3);
		
		if(rng == 1){ // 33%
			x_pressed = buffer_duration;
		}
		else if(rng == 2){ // 33%
			y_pressed = buffer_duration;
		}
		else{ // 33%
			b_pressed = buffer_duration;
		}
	}
	// Surf
	else if(rng < 0.25){ // 15%
		diagonal_input_hold = true;
		x_pressed = buffer_duration;
	}
	// Bash
	else if(rng < 0.40){ // 15&
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
