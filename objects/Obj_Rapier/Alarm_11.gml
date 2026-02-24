event_inherited();
	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Meter moves
	if(meter >= 20 && irandom_range(1, 8) == 1){ // 12.5%
		rb_hold = true;
		if(irandom_range(0, 1)){ // 50%
			x_pressed = buffer_duration;
		}
		else{
			y_pressed = buffer_duration;
		}
	}
	// Lunge
	else if(rng < 0.25){ // 25%
		rng = irandom_range(0, 2);
		down_forward_pressed = buffer_duration;
		if(rng == 0){ // 33%
			x_pressed = buffer_duration;
		}
		else if(rng == 0){ // 33%
			y_pressed = buffer_duration;
		}
		else{
			b_pressed = buffer_duration;
		}
	}
	// Toe pick
	else if(rng < 0.35){ // 10%
		diagonal_input_hold = true;
		y_pressed = buffer_duration;
	}
	// Gooch impaler
	else if(rng < 0.40){ // 5%
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	// Back spin
	else if(rng < 0.55 && !grounded){ // 15%
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