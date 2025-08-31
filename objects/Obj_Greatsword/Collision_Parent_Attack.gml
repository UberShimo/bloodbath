if(action == "Earth Start"){
	save_current_state();
	earth_parry_success = true;
}

event_inherited();

if(earth_parry_success){
	// Kinda wierd usage but it works nice!
	cancel_the_cancel();
	earth_parry_success = false;
	action = "Earth Start";
}