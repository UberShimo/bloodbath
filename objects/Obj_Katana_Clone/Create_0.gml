event_inherited();

life_span = 24;

#region Sprites
stand_spr = Spr_Katana_Stand;
forward_spr = Spr_Katana_Forward;
backward_spr = Spr_Katana_Backward;
dash_forward_spr = Spr_Katana_Dash_Forward;
dash_backward_spr = Spr_Katana_Dash_Backward;
crouch_spr = Spr_Katana_Crouch;
ascend_spr = Spr_Katana_Ascend;
descend_spr = Spr_Katana_Descend;
stunned_spr = Spr_Katana_Stunned;
launched_spr = Spr_Katana_Launched;
land_spr = Spr_Katana_Land;
#endregion

// Fixed stats
HP = 100;
max_HP = HP;
meter = 0;
max_meter = 100;
hearts = global.heart_amount;
// Katana stats
dash_speed = 0;
dash_blink = 0;
dash_duration = 0;
dash_grip = 0;
grip = 0;
air_grip = 0;
weight = 0;
character_width = 24;
character_height = global.standard_height;
shake_amount = 0;
player_color = c_white;

action = noone;
h_velocity = 0;
v_velocity = 0;
grounded = false;
action_alarm = 0;
cancels = 0;
is_collidable = false;

dash_forward = false;
dash_backward = false;

action_trigger = function(){
	if(action == "Quickdraw"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Quickdraw_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_Quickdraw_recovery;
		image_index = 0;
		
		life_span = generate_sprite_frames(sprite_index);
	}
}

initiate = function(initiator){
	HP = initiator.HP;
	meter = initiator.meter;
	index = initiator.index;
	hearts = initiator.hearts;
	player_color = initiator.player_color;
	image_xscale = initiator.image_xscale;
	
	dash_speed = initiator.dash_speed;
	dash_blink = initiator.dash_blink;
	dash_duration = initiator.dash_duration;
	dash_grip = initiator.dash_grip;
	grip = initiator.grip;
	weight = initiator.weight;
}