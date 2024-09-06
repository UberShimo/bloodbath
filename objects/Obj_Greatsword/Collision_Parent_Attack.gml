if(action == "Earth Start"){
	earth_parry_success = true;
}

event_inherited();

if(earth_parry_success){
	earth_parry_success = false;
	action = "Earth Start";
}