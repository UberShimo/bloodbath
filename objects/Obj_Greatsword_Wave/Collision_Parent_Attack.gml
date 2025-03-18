if(other.spawner == spawner && !other.is_projectile){
	// Bless you for hitting your wave
	spawner.cancels = spawner.max_cancels;
	spawner.can_cancel = true;
	spawner.HP += 8;
	if(spawner.HP > spawner.max_HP){
		spawner.HP = spawner.max_HP;
	}
	
	effect = instance_create_depth(spawner.x, spawner.y, 1, Eff_Cancel);
	effect.initiate(spawner);
	effect.image_blend = c_aqua;
	
	hitbox = instance_create_depth(x, y, depth, Obj_Greatsword_Splash_hitbox);
	hitbox.initiate(self);
	
	instance_destroy()
}

