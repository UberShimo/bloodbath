event_inherited();

is_active = false;
is_projectile = true;
collision_check_with_distance = false;
weight = 0.4;
original_weight = weight;
cant_hurt_alarm = 0;

// Ball things
existing_hitbox = noone;
is_returning = false;
hitbox_list = ds_list_create();
max_velocity = 16;

collide = function(){
	if(!is_returning){
		// Effect
		if(existing_hitbox != noone){
			spawn_effect(x, y, 8, Eff_Spark, 1, 0.1, c_white, 0.5, 1, 0, -30, 210);
			audio_play_sound(Snd_Knack, 0, false);
		}
	
		h_velocity = 0;
		v_velocity = 0;
	}
	// Go through collision if it is returning to Baller!
	else{
		move_step();
	}
}