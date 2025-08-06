event_inherited();

if(implode_alarm > 0){
	implode_alarm -= logic_time;
	
	if(implode_alarm <= 0){
		hitbox = instance_create_depth(x, y, 0, Obj_Cultist_Circle_Implosion_hitbox);
		hitbox.image_blend = image_blend; // Give it some color lol
		hitbox.initiate(self);
		instance_destroy();
	}
}

