event_inherited();

damage_alarm -= logic_time;
if(damage_alarm <= 0){
	damage_alarm = damage_alarm_time;
	
	if(instance_exists(doppelganger)){
		doppelganger.HP -= 1;
		if(doppelganger.HP <= 0){
			spawn_effect(doppelganger.x, doppelganger.y, 1, Eff_Ring, 1, 0.1, c_lime, 0, 0, 1);
			instance_destroy(doppelganger);
			instance_destroy();
		}
	}
	else{
		instance_destroy();
	}
}
