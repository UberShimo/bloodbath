event_inherited();

eff = instance_create_depth(x, y, depth, Obj_Bow_ULTRA_Arrow_fade_eff);
eff.image_xscale = image_xscale;
eff.image_angle = image_angle;

if(time_reset_alarm > 0){
	time_reset_alarm -= global.game_time;
	
	if(time_reset_alarm <= 0){
		time_reset_alarm = 0;
		
		object_time = 1;
	}
}

// Follow target
if(target != noone){
	// Set acceleration value
	val = acceleration;
	if(abs(h_velocity) < val){
		val /= 10;
	}
	// H Move or break
	// Right side of enemy
	if(x > target.x){
		if(h_velocity > 0){
			h_velocity -= break_power;
		}
		else if(h_velocity > -max_speed){
			h_velocity -= val;
		}
	}
	// Left side of enemy
	else{
		if(h_velocity < 0){
			h_velocity += break_power;
		}
		else if(h_velocity < max_speed){
			h_velocity += val;
		}
	}
	// V movement
	if(y > target.y+v_speed){
		v_velocity = -v_speed;
	}
	else if(y < target.y-v_speed){
		v_velocity = +v_speed;
	}
	else{
		v_velocity = 0;
	}
}

image_angle = point_direction(0, 0, h_velocity, v_velocity);

if(existing_hitbox != noone){
	existing_hitbox.image_angle = image_angle;
	existing_hitbox.x = x;
	existing_hitbox.y = y;
}

// Creating hitbox logic
velocity = point_distance(0, 0, h_velocity, v_velocity);

if(velocity > 8){
	// Spawn da hitbox
	if(existing_hitbox == noone){
		existing_hitbox = instance_create_depth(x, y, depth, Obj_Bow_ULTRA_hitbox);
		existing_hitbox.initiate(spawner); // Its not this arrow that initiate the hitbox ok?
		turns += 1;
	}
}
// Harmless
else{
	if(existing_hitbox != noone){
		instance_destroy(existing_hitbox);
		existing_hitbox = noone;
	}
}

max_duration -= logic_time;

if(max_duration <= 0){
	instance_destroy(existing_hitbox);
	instance_destroy();
}