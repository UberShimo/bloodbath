event_inherited();

detonation_timer -= logic_time;

if(detonation_timer <= 0){
	hitbox = instance_create_depth(x, y, depth, Obj_Knife_Grenade_hitbox);
	hitbox.initiate(self);
	hitbox.index = -1;
	instance_destroy();
}

image_angle -= h_velocity;
