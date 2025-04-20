event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(meter >= 35 && irandom_range(1, 8) == 1){ // 12.5%
		down_hold = true;
		rb_pressed = buffer_duration;
	}
	// Circle
	else if(rng < 0.3){ // 30%
		if(circle != noone){
			double_down_pressed = buffer_duration;
				
			rng = irandom_range(0, 2);
			if(rng == 0){ // 33%
				x_pressed = true;
			}
			else if(rng == 1){ // 33%
				y_pressed = true;
			}
			else{ // 33%
				b_pressed = true;
			}
		}
		else{
			if(irandom_range(0, 1) == 0){ // 50%
				down_forward_pressed = buffer_duration;
			}
			else{
				down_backward_pressed = buffer_duration;
			}
			x_pressed = buffer_duration;
		}
	}
	// Star
	else if(rng < 0.5){ // 20%
		y_pressed = buffer_duration
		down_forward_pressed = buffer_duration;
		
		rng = irandom_range(0, 2)
		if(rng == 1){
			down_hold = true;
		}
		else if(rng == 2){
			up_hold = true;
		}
	}
	else if(rng < 0.6 && meter_circle != noone){
		double_down_pressed = buffer_duration;
		rb_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		down_backward_pressed = true;
		half_circle_forward_pressed = true;
	}
}