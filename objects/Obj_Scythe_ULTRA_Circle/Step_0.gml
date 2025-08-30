event_inherited();

y -= lift_amount*logic_time;

// SPIN!
image_angle += 22;

if(spawn_hitbox_alarm > 0){
	spawn_hitbox_alarm -= logic_time;
	
	if(spawn_hitbox_alarm <= 0){
		hitbox = instance_create_depth(x, y, 0, Obj_Scythe_ULTRA_hitbox);
		hitbox.initiate(self);
		spawn_hitbox_alarm = spawn_hitbox_frequence;
	}
}