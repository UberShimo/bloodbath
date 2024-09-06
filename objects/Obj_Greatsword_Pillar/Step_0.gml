event_inherited();

if(action_alarm > 0){
	action_alarm -= logic_time;
	
	if(action_alarm <= 0){
		action_alarm = 0;
		
		hitbox = instance_create_depth(x, y, 0, Obj_Greatsword_Pillar_hitbox);
		hitbox.initiate(self);
		
		sprite_index = Spr_Greatsword_Pillar;
		image_index = 0;
		destroy_alarm = generate_sprite_frames(sprite_index);
	}
}

if(destroy_alarm > 0){
	destroy_alarm -= logic_time;
	
	if(destroy_alarm <= 0){
		instance_destroy();
	}
}