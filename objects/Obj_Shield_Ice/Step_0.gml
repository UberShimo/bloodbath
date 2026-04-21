
event_inherited();

duration -= logic_time;

if(duration <= 0){
	spawn_effect(x, y, 1, Eff_Shield_Ice_Dissapear, 1, 0, c_white, 1, 1, 0, 0, 0);
	instance_destroy();
}