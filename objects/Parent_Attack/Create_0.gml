event_inherited();

//Outline shader stuff
texel_handle = shader_get_uniform(Shd_Outline, "inTexel");
outline_handle = shader_get_uniform(Shd_Outline, "outlineColor");

outline_color = [1, 1, 1, 0.4]; // RGB+alpha

spawner = noone;
spawner_action = noone;
time_reset_alarm = 0; // Time alarm
freeze_amount = 0; // % in time (0.1 = 10% time speed)
shake_amount = 0; // How much you shake?
startup = 0; // 100% informational not used in logic
recovery = 0; // 100% informational not used in logic
info = "";
// Essential stats
damage = 0;
hit_stun = 0;
hit_push = 0;
h_launch = 0;
v_launch = 0;
freeze_duration = 1;
extra_freeze_duration = 0;
shake_impact = 0; // Shakes the opponent on impact
swing_sound = Snd_Swing1;
hit_sound = Snd_Hit1;
// Characterizing stats
meter_gain = 0;
meter_gain_multiplier = 1; // % based
weight = 0;
active_frames = 8; // Hitbox dissapears after those frames
projectile_duration = 0; // Projectile dissapears after those frames
hit_effect_scale = 1;
hit_effect_time = 1;
effect = Nothing; // Hit effect or whatever that is left behind after attack
hit_effect_y = 0; // Makes hit effect spawn between opponent and this y value
collision_check_with_distance = true; // Checks in a line instead of around object
collision_check_distance = sprite_width/2; // Projectile related
is_active = true;
is_parryable = true;
is_shockwave = false; // Means opponent will be hit away from center of hitbox
shockwave_power = 0; // How powerful launch the shockwave has
is_launcher = false; // Launch opponent if they are hit
is_projectile = false;
is_side_relevant = false;
is_sticky = false; // Sticks to spawner
is_cancelable = false; // Can cancel move even if you dont hit anything
is_final = false; // Cannot be canceled into other moves (informational)
is_priority = false; // Some attacks have sweetspot hitboxes that take some priorities for example
priority_struck_duration = 8; // Time to be priority struck and unable to get hit by other hitboxes
h_affecting = true; // Means that is knocks and pushes in horizontal velocity
v_affecting = true; // Means that is knocks and pushes in vertical velocity
is_collidable = true; // Goes through walls or not?
is_initiated_by_character = true;
hitfallable = true; // Mostly so you can hitfall moves that lift you up from ground

// Methods
initiate = function(initiator){
	index = initiator.index;
	spawner = initiator;
	image_xscale *= initiator.image_xscale;
	image_yscale *= initiator.image_yscale;
	object_time = initiator.object_time;
	outline_color = initiator.outline_color;
	
	// Is initiated by a character?
	is_initiated_by_character = object_is_ancestor(initiator.object_index, Parent_Character);
	
	if(is_initiated_by_character){
		spawner_action = spawner.action;
		meter_gain = (damage/2)*meter_gain_multiplier;
		if(is_cancelable){
			initiator.can_cancel = true;
		}
	
		if(is_final){
			initiator.cancels = 0;
			// Cancel eff
			eff = instance_create_depth(initiator.x, initiator.y, 1, Eff_Cancel);
			eff.initiate(initiator);
		}
	}
	
	if(global.is_debugging){
		visible = true;
		image_alpha = 0.5;
		depth = -5;
	}
	
	if(effect != Nothing){
		eff = instance_create_depth(x, y, depth, effect);
		eff.initiate(self);
	}
	
	audio_play_sound(swing_sound, 0, false);
}

// Projectile only
collide = function(){
	// What happens when you hit the wall?
	// If you dont want anything to happen when colliding use move_step();
}