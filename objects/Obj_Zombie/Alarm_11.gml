event_inherited();
	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Momentum shift
	if(meter >= 25 && irandom_range(1, 100) == 1){ // 1%
		meter_hold = true;
		if(irandom_range(0, 1)){ // 50%
			light_attack_pressed = buffer_duration;
		}
		else{
			medium_attack_pressed = buffer_duration;
		}
	}
	// 6F
	else if(rng < 0.05){ // 5%
		forward_hold = true;
		light_attack_pressed = buffer_duration;
	}
	// Faceplant
	else if(rng < 0.15){ // 10%
		diagonal_input_hold = true;
		medium_attack_pressed = buffer_duration;
	}
	// Arm rip
	else if(rng < 0.25){ // 10%
		diagonal_input_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
	// Flipswing
	else if(rng < 0.35){ // 10%
		down_forward_pressed = buffer_duration;
		light_attack_pressed = buffer_duration;
	}
	// Spit
	else if(rng < 0.45){ // 10%
		down_forward_pressed = buffer_duration;
		medium_attack_pressed = buffer_duration;
	}
	// Bite
	else if(rng < 0.55){ // 10&
		down_forward_pressed = buffer_duration;
		heavy_attack_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		meter_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
}