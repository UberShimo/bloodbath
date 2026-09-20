event_inherited();

is_active = false;
is_projectile = true;
spawner = noone;
action = noone;
h_velocity = 0;
v_velocity = 0;
weight = 0;
swing_sound = Snd_Click_1;

life_span = 0;
action_alarm = 0;
alpha_increase = 0;
shake_amount = 2;

action_trigger = function(){
	if(action == "Quickdraw"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Quickdraw_hitbox);
		attack.initiate(self);
		shake_amount = 0;
		
		sprite_index = Spr_Katana_Quickdraw_recovery;
		image_index = 0;
		image_blend = c_white;
		image_alpha = 1;
		
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_lime, 0, 0, 0.2);
		life_span = 32;
		
		// Achievement update
		if(instance_exists(Obj_Immortal_Dummy)){
			Obj_Immortal_Dummy.katana_has_used_clone = true;
		}
	}
	else if(action == "Teleport Spawner"){
		if(instance_exists(spawner)){
			instance_create_depth(spawner.x, spawner.y, 0, Eff_Clone_Dissapear);
			spawner.x = x;
			spawner.y = y;
		}
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_lime, 0, 0, 0.2);
		// Achievement update
		if(instance_exists(Obj_Immortal_Dummy)){
			Obj_Immortal_Dummy.katana_has_used_clone = true;
		}
		instance_destroy();
	}
}
