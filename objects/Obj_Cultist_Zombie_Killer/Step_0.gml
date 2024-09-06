event_inherited();

damage_alarm -= logic_time;
if(damage_alarm <= 0){
	damage_alarm = damage_alarm_time;
	
	if(instance_exists(zombie)){
		zombie.HP -= 1;
		if(zombie.HP <= 0){
			spawn_effect(zombie.x, zombie.y, 1, Eff_Ring, 1, 0.1, c_lime, 0, 0, 1);
			instance_destroy(zombie);
			instance_destroy();
		}
	}
	else{
		instance_destroy();
	}
}
