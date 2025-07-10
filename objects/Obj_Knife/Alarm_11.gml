event_inherited();

	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Meter moves
	if(meter >= 30 && irandom_range(1, 8) == 1){ // 12.5%
		if(irandom_range(1, 2) == 1){ // 50%
			down_forward_pressed = buffer_duration;
		}
		else{
			double_down_pressed = buffer_duration;
		}
		rb_pressed = buffer_duration;
	}
	// Mark dash
	else if(rng < 0.1){ // 10%
		down_forward_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	// Mark teleport
	else if(rng < 0.2){ // 10%
		double_down_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	// Mark dagger
	else if(rng < 0.4){ // 20&
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	// Mark spin
	else if(rng < 0.55 && !grounded){ // 15%
		double_down_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	// Grenade
	else if(rng < 0.7 && !grounded){ // 15%
		double_down_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		rb_pressed = buffer_duration;
		half_circle_forward_pressed = buffer_duration;
	}
}