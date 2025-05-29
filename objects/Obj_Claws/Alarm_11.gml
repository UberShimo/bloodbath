event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		if(irandom_range(0, 1)){ // 50%
			down_forward_pressed = buffer_duration;
		}
		else{
			double_down_pressed = buffer_duration;
		}
		rb_pressed = buffer_duration;
	}
	// H ring
	else if(rng < 0.1){ // 10%
		if(instance_exists(ring1)){
			if(irandom_range(0, 1) == 0){
				down_backward_pressed = buffer_duration;
			}
			else{
				down_forward_pressed = buffer_duration;
			}
		}
		else{
			double_down_pressed = buffer_duration;
		}
		x_pressed = buffer_duration;
	}
	// V ring
	else if(rng < 0.2){ // 10%
		if(instance_exists(ring2)){
			if(irandom_range(0, 1) == 0){
				down_backward_pressed = buffer_duration;
			}
			else{
				down_forward_pressed = buffer_duration;
			}
		}
		else{
			double_down_pressed = buffer_duration;
		}
		y_pressed = buffer_duration;
	}
	// Penguin!
	else if(rng < 0.35){ // 15%
		down_forward_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	// Claw dance
	else if(rng < 0.5){ // 15%
		double_down_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		rb_pressed = true;
		half_circle_forward_pressed = true;
	}
}