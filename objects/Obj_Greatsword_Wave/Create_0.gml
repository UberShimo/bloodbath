event_inherited();

damage = 0;
hit_stun = 0;
hit_push = 0;
freeze_duration = 0;
h_launch = 0;
v_launch = 0;

is_active = false;
is_projectile = true;
projectile_duration = 600;
is_final = true;

// Wave stuff
collide = function(){
	if(v_velocity > 0){
		hitbox = instance_create_depth(x, y, depth, Obj_Greatsword_Splash_hitbox);
		hitbox.initiate(self);
	
		instance_destroy()
	}
}