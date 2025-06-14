event_inherited();

if(legit_hit_check){
	// Effects
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_white, 0.5, 0.5, 0.2);
	spawn_effect(x, y, 6, Eff_Splash, 1, 0.1, c_white, 1, 2);

	if(instance_number(Obj_Target) <= 1){
		global.game_time = 0;
		Obj_Target_Run_Manager.alarm[11] = 360;
		Obj_Target_Run_Manager.show_final_time = true;
		Obj_Target_Run_Manager.timer_on = false;
	}
	
	// Gotta remove shake from projectiles for some reason?
	if(other.is_projectile){
		Obj_Match_Camera.shake = 0;
	}
	instance_destroy();
}