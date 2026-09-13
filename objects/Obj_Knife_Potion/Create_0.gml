event_inherited();

depth = -3;

is_projectile = true;
is_final = true;
weight = 0.3;
collision_check_with_distance = false;

is_active = false;
priority_struck = false;
priority_struck_alarm = 0;
collision_protection = 10; // 10 frames of cant hit opponent

collide = function(){
	explode();
}

explode = function(){
	hitbox = instance_create_depth(x, y, depth-5, Obj_Knife_Potion_hitbox);
	hitbox.initiate(self);
	instance_destroy();
}