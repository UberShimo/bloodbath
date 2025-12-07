event_inherited();
	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Meter moves
	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		rb_hold = true;
		if(irandom_range(0, 1)){ // 50%
			x_pressed = buffer_duration;
		}
		else{
			y_pressed = buffer_duration;
		}
	}
	// Flight
	else if(rng < 0.15){ // 15%
		down_forward_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	// Birdie
	else if(rng < 0.3){ // 15%
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	// Reap
	else if(rng < 0.45){ // 15&
		down_forward_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	// Lightning
	else if(rng < 0.60 && grounded){ // 15%
		double_down_pressed = buffer_duration;
		
		rng = irandom_range(0, 2);
		if(rng == 1){ // 33%
			x_pressed = buffer_duration;
		}
		else if(rng == 2){ // 33%
			y_pressed = buffer_duration;
		}
		else{ // 33%
			b_pressed = buffer_duration;
		}
		
		rng = irandom_range(0, 2);
		if(rng == 1){ // 33%
			backward_hold = true;
		}
		else if(rng == 2){ // 33%
			forward_hold = true;
		}
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		rb_hold = true;
		b_pressed = buffer_duration;
	}
}