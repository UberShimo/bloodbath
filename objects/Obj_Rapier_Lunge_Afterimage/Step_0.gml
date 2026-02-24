
event_inherited();

if(action_alarm > 0){
	action_alarm -= logic_time;
	
	if(action_alarm <= 0){
		attack = instance_create_depth(x, y, 0, Obj_Rapier_Lunge_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Rapier_Magic_Lunge_Afterimage_recovery;
		destroy_alarm = generate_sprite_frames(sprite_index);
	}
}

if(destroy_alarm > 0){
	destroy_alarm -= logic_time;
	
	if(destroy_alarm <= 0){
		instance_destroy();
	}
}