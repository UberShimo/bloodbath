event_inherited();

if(spawner.spawner == other){ // hehe... spawner.spawner
	other.mini_jump_disabled = true;
	other.mini_jump_disabled_alarm = 12;
	other.h_velocity = 6*image_xscale;
	other.v_velocity = -14;
}