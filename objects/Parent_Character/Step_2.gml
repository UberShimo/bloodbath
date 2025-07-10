event_inherited();

// Security thing so you dont get stuck in landing etc...

if(recover_alarm <= 0 && action_alarm <= 0){
	action = noone;
}