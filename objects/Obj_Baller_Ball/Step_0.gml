event_inherited();

if(is_returning){
	spd = 12;
	dir = point_direction(x, y, spawner.x, spawner.y);
	h_velocity = lengthdir_x(spd, dir);
	v_velocity = lengthdir_y(spd, dir);
}

vel = get_velocity();
// Hurting ball
if(vel > 7 && cant_hurt_alarm <= 0){
	// Slow the ball down
	if(vel > max_velocity){
		dir = point_direction(0, 0, h_velocity, v_velocity);
		h_velocity = lengthdir_x(max_velocity, dir);
		v_velocity = lengthdir_y(max_velocity, dir);
	}
	// Spawn da hitbox
	if(existing_hitbox == noone){
		existing_hitbox = instance_create_depth(x, y, depth, Obj_Baller_Ball_hitbox);
		existing_hitbox.ball = self;
		existing_hitbox.initiate(spawner);
	}
	// Make proper stats
	existing_hitbox.hit_push = abs(h_velocity/2);
	existing_hitbox.h_launch = abs(h_velocity/2);
	existing_hitbox.v_launch = v_velocity/2;
	
	// Create effect
	instance_create_depth(x, y, depth, Eff_Baller_Ball);
}
// Harmless ball
else{
	if(existing_hitbox != noone){
		instance_destroy(existing_hitbox);
		existing_hitbox = noone;
	}
}

// Cant hurt alarm
if(cant_hurt_alarm > 0){
	cant_hurt_alarm -= logic_time;
	if(cant_hurt_alarm <= 0){
		cant_hurt_alarm = 0;
	}
}

// Turn invisible if Baller is invisible
visible = spawner.visible;

// Dissapear if spawner dont exist obviously...
if(!instance_exists(spawner)){
	instance_destroy();
}