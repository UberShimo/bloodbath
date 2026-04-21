
// Remove parry if hit from behind
if(action == "Bash Charge"){
	bash_parry_success = true;
	save_current_state();
	// Check hit direciton
	// Projectile
	if(other.is_projectile && other.h_velocity != 0){
		if(other.h_velocity > 0){
			hit_direction = -1;
		}
		else{
			hit_direction = 1;
		}
	}
	// Side relevant
	else if(other.is_side_relevant || other.is_shockwave){
		if(x > other.x){
			hit_direction = -1;
		}
		else{
			hit_direction = 1;
		}
	}
	// Normal melee
	else{
		if(other.image_xscale > 0){
			hit_direction = -1;
		}
		else{
			hit_direction = 1;
		}
	}
			
	if((hit_direction > 0 && image_xscale < 0)
	|| (hit_direction < 0 && image_xscale > 0)){
		is_parrying = false;
		bash_parry_success = false;
	}
}

event_inherited();

if(bash_parry_success){
	// Kinda wierd usage but it works nice!
	cancel_the_cancel();
	bash_parry_success = false;
	action = "Bash Charge";
}