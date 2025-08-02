if(action == "Earth Start"){
	earth_parry_success = true;
}

if(ULTRA_invincible){
	save_current_state();
	is_parrying = true;
	if(!other.is_parryable){
		other.is_parryable = true;
	}
}

event_inherited();

if(ULTRA_invincible){
	// Kinda wierd usage but it works nice!
	cancel_the_cancel();
	is_parrying = false;
}

if(earth_parry_success){
	earth_parry_success = false;
	action = "Earth Start";
}