event_inherited();

// Stats
jump_power = 11;
mini_jump_power = 0.6; // % based
extra_jump_strength = 1; // % based

#region Sprites
stand_spr = Spr_Dojo_Stand;
forward_spr = Spr_Dojo_Forward;
backward_spr = Spr_Dojo_Backward;
dash_forward_spr = Spr_Dojo_Dash_Forward;
dash_backward_spr = Spr_Dojo_Dash_Backward;
crouch_spr = Spr_Dojo_Crouch;
ascend_spr = Spr_Dojo_Ascend;
descend_spr = Spr_Dojo_Descend;
stunned_spr = Spr_Dojo_Stunned;
launched_spr = Spr_Dojo_Launched;
land_spr = Spr_Dojo_Land;
parry_spr = Spr_Dojo_Parry;
#endregion

is_doing_F_loop = false;
is_jumping = false;
is_dumbly_attacking = false;

hits = 0;
combo_damage = 0;

// Methods
action_trigger = function(){
	// Normal moves
	if(action == "F"){
		attack = instance_create_depth(x, y, 0, Obj_Dojo_F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Dojo_F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "L"){
		attack = instance_create_depth(x, y, 0, Obj_Dojo_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Dojo_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "S"){
		attack = instance_create_depth(x, y, 0, Obj_Dojo_S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Dojo_S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}
