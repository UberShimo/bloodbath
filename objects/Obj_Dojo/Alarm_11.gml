event_inherited();

	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Projectile
	if(rng < 0.25){ // 25%
		if(irandom_range(0, 1)){ // 50%
			down_forward_pressed = buffer_duration;
		}
		else{
			down_backward_pressed = buffer_duration;
		}
		y_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		rb_hold = true;
		b_pressed = buffer_duration;
	}
}