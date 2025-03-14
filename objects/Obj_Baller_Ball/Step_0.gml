event_inherited();

velocity = point_distance(0, 0, h_velocity, v_velocity);

if(is_returning){
	spd = 12;
	dir = point_direction(x, y, spawner.x, spawner.y);
	h_velocity = lengthdir_x(spd, dir);
	v_velocity = lengthdir_y(spd, dir);
}

// Hurting ball
if(velocity > 7 && cant_hurt_alarm <= 0){
	// Spawn da hitbox
	if(existing_hitbox == noone){
		existing_hitbox = instance_create_depth(x, y, depth, Obj_Baller_Ball_hitbox);
		existing_hitbox.ball = self;
		existing_hitbox.initiate(spawner); // Its not this ball that initiate the hitbox ok?
	}
	// Make proper stats
	existing_hitbox.hit_push = abs(h_velocity/2);
	existing_hitbox.h_launch = abs(h_velocity/2);
	existing_hitbox.v_launch = v_velocity/2;
	
	// Make it launcher?
	if(v_velocity < -6){
		existing_hitbox.is_launcher = true;
	}
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