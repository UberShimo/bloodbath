event_inherited();

//Outline shader stuff
texel_handle = shader_get_uniform(Shd_Outline, "inTexel");
outline_handle = shader_get_uniform(Shd_Outline, "outlineColor");

outline_color = [1, 1, 1, 0.4]; // RGB+alpha

depth = -1;

#region Random stuff
controller_index = -1;
player_number = 0; // The number that floats over your head
is_controllable = false;
is_respawning = false;
is_CPU = false;
exit_count = 0;
exit_count_goal = 180;
player_color = c_white;
draw_mini_ui = global.chaos_mode;
exit_text_x = -16;
exit_text_y = 0;
#endregion

#region Initialize input values / buffers
buffer_duration = 16;
meter_dash_buffer_duration = 8;

forward_hold = false;
backward_hold = false;
down_hold = false;
up_hold = false;
forward_pressed = 0;
backward_pressed = 0;
down_pressed = 0;
a_pressed = 0;
a_hold = false;
b_pressed = 0;
b_hold = false;
x_pressed = 0;
x_hold = false;
y_pressed = 0;
y_hold = false;
rb_pressed = 0;
rb_hold = false;
lb_pressed = 0;
lb_hold = false;
start_hold = false;
rs_up = false;
rs_down = false;
rs_right = false;
rs_left = false;
down_forward_pressed = 0;
backward_down_pressed = 0;
half_circle_forward_pressed = 0;
down_backward_pressed = 0;
forward_down_pressed = 0;
half_circle_backward_pressed = 0;
double_down_pressed = 0;
meter_dash_lb_pressed = 0;
meter_dash_rb_pressed = 0;
platdrop_pressed = false;
platdrop_hold = false;
faceback_hold = false;
cancel_prevent_hold = false;
#endregion

#region Sprites
stand_spr = noone;
forward_spr = noone;
backward_spr = noone;
dash_forward_spr = noone;
dash_backward_spr = noone;
crouch_spr = noone;
ascend_spr = noone;
descend_spr = noone;
stunned_spr = noone;
launched_spr = noone;
jump_spr = noone;
parry_spr = noone;
pose1_spr = noone;
pose2_spr = noone;
pose3_spr = noone;
#endregion

#region Stats
// Fixed stats
HP = 120;
max_HP = HP;
meter = 0;
max_meter = 100;
hearts = global.heart_amount;
can_cancel = false;
cancels = 2;
max_cancels = cancels;
dash_cancel_max_amount = 0.75; // % based
parry_duration = 48;
parry_active_frames = 10; // Counts down in real time even if time is slowed/has stopped
meter_gain_by_approaching = 10/60; // 10 meter / second
meter_gain_by_dashing = 5;
is_parrying = false;
is_unstoppable = false;
is_invincible = false;
is_collidable = true;
goes_through_collision = false; // SUPER rarely used since this is risky business
DoT_tick_dmg = 0; // Poison only lol
DoT_alarm = 0; // Poison only lol
// Variating stats
start_speed = 3;
max_speed = 6;
acceleration = 0.1;
grip = global.standard_grip; // Slippy: 0.3, Standard: 0.5, Steady: 0.7
air_control = 0.1;
air_grip = 0; // This grip replaces original grip when above 0
dash_speed = 12;
dash_lift = 0; // Only used for Bow basically...
dash_blink = 16;
dash_duration = 24;
dash_grip = 1;
jump_power = 12;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
jump_startup = 4; // Amount of frames to take off from ground
weight = global.standard_weight; // Light: 0.6, Standard: 0.7, Heavy: 0.8
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height; // Short: 48, Standard: 64, Tall: 80
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

#region Gameplay related
action = noone;
last_action = noone; // Used for checking if cancel is legit
cancel_effect = noone;
launcher_shake_amount = 2;
doing_action_by_canceling = false;
hitbox_list = ds_list_create();
legit_hit_check = false;
cancelable_recovery_frames = global.cancelable_recovery_frames;
closest_enemy = self;
multi_hit_action_index = 0; // When one move does many attacks this variable keeps track on what attack you are on
wall_bounce_limit = 6;
ground_bounce_limit = 10;
grounded = true;
priority_struck = false; // When you get hit by a priority hitbox. Sweetspots usually. This variable resets in alarm[9]
is_in_wall = false;
is_close_to_wall = false;
colliding_wall = noone;
character_push_away_amount = 8;
mini_jump_disabled = false; // Used so characters can properly get launched into air without losing v_velocity
#endregion

#region Alarms
action_alarm = 0;
parry_alarm = 0;
jump_alarm = 0;
recover_alarm = 0;
time_reset_alarm = 0;
respawn_alarm = 0;
invincibility_alarm = 0;
death_alarm = 0;
priority_struck_alarm = 0;
mini_jump_disabled_alarm = 0;
#endregion

// Methods
die = function(){
	action = "Stunned";
	HP = 0;
	shake_amount = 20;
	object_time = 0;
	time_reset_alarm = 30;
	death_alarm = 30;
}

action_trigger = function(){
	// Activated by action_alarm.
	// This alarm performs the queued action. Like spawning hitboxes and shit...
}

reset_buffers = function(){
	forward_pressed = 0;
	down_pressed = 0;
	backward_pressed = 0;
	a_pressed = 0;
	b_pressed = 0;
	x_pressed = 0;
	y_pressed = 0;
	lb_pressed = 0;
	rb_pressed = 0;
	down_forward_pressed = 0;
	half_circle_forward_pressed = 0;
	down_backward_pressed = 0;
	half_circle_backward_pressed = 0;
	double_down_pressed = 0;
}

// Slightly wierd function since it sometimes is used where you dont really face closest enemy...
face_closest_enemy = function(){
	find_closest_enemy();
	
	// Normal facing action time
	if(!global.chaos_mode && !global.target_run_mode && instance_number(Parent_Character) > 1){
		
		if(x < closest_enemy.x){
			image_xscale = 1;
		}
		else{
			image_xscale = -1;
		}
	
		if(faceback_hold){
			image_xscale *= -1;
		}
	}
	// You are alone... Or in chaos mode!
	else if(backward_hold){
		image_xscale *= -1;
		// CPU specific so it dont get stuck in turn around loop
		if(is_CPU){
			backward_hold = false;
			forward_hold = true;
		}
	}
}

find_closest_enemy = function(){
	closest_enemy = self;
	enemy_distance = room_width;
	
	// Loop through characters and find closest enemy
	for(i = 0; i < instance_number(Parent_Character); i++){
		if(instance_find(Parent_Character, i).index != index){
			enemy = instance_find(Parent_Character, i);
			temp_distance = abs(x-enemy.x);
			if(temp_distance < enemy_distance){
				enemy_distance = temp_distance;
				closest_enemy = enemy;
			}
		}
	}
}

read_input = function(){
	if(is_controllable){
		// Facing right
		if(image_xscale > 0){
			forward_held = forward_hold;
			forward_hold = gamepad_button_check(controller_index, gp_padr)
			|| gamepad_axis_value(controller_index, gp_axislh) > 0.5;
		
			if(!forward_held && forward_hold){
				forward_pressed = buffer_duration;
			}
		
			backward_held = backward_hold;
			backward_hold = gamepad_button_check(controller_index, gp_padl)
			|| gamepad_axis_value(controller_index, gp_axislh) < -0.5;
		
			if(!backward_held && backward_hold){
				backward_pressed = buffer_duration;
			}
		}
		// Facing left
		else{
			forward_held = forward_hold;
			forward_hold = gamepad_button_check(controller_index, gp_padl)
			|| gamepad_axis_value(controller_index, gp_axislh) < -0.5;
		
			if(!forward_held && forward_hold){
				forward_pressed = buffer_duration;
			}
		
			backward_held = backward_hold;
			backward_hold = gamepad_button_check(controller_index, gp_padr)
			|| gamepad_axis_value(controller_index, gp_axislh) > 0.5;
		
			if(!backward_held && backward_hold){
				backward_pressed = buffer_duration;
			}
		}
		// Down
		down_held = down_hold;
		down_hold = gamepad_button_check(controller_index, gp_padd)
		|| gamepad_axis_value(controller_index, gp_axislv) > 0.5;
	
		// Double down
		if(down_pressed > 0 && !down_held && down_hold){
			double_down_pressed = buffer_duration;
		}
		
		if(!down_held && down_hold){
			down_pressed = buffer_duration;
		}
	
		// Up hold
		up_hold = gamepad_button_check(controller_index, gp_padu)
		|| gamepad_axis_value(controller_index, gp_axislv) < -0.5;
	
		// Faceback hold
		faceback_hold = gamepad_button_check(controller_index, gp_shoulderlb);
	
		// Cancel prevent hold 
		cancel_prevent_hold = gamepad_button_check(controller_index, gp_shoulderrb);

		// Jump
		if(gamepad_button_check_pressed(controller_index, gp_face1)){
			a_pressed = buffer_duration;
		}
		a_hold = gamepad_button_check(controller_index, gp_face1);
	
		// Action buttons
		if(gamepad_button_check_pressed(controller_index, gp_face2)){
			b_pressed = buffer_duration;
		}
		b_hold = gamepad_button_check(controller_index, gp_face2);
	
		if(gamepad_button_check_pressed(controller_index, gp_face3)){
			x_pressed = buffer_duration;
		}
		x_hold = gamepad_button_check(controller_index, gp_face3);
	
		if(gamepad_button_check_pressed(controller_index, gp_face4)){
			y_pressed = buffer_duration;
		}
		y_hold = gamepad_button_check(controller_index, gp_face4);
	
		if(gamepad_button_check_pressed(controller_index, gp_shoulderr)){
			rb_pressed = buffer_duration;
			meter_dash_rb_pressed = meter_dash_buffer_duration;
		}
		rb_hold = gamepad_button_check(controller_index, gp_shoulderr);
	
		if(gamepad_button_check_pressed(controller_index, gp_shoulderl)){
			lb_pressed = buffer_duration;
			meter_dash_lb_pressed = meter_dash_buffer_duration;
		}
		lb_hold = gamepad_button_check(controller_index, gp_shoulderl);
	
		// Platdrop (this is one special since it doesnt use the buffer_duration)
		if(down_hold && gamepad_button_check_pressed(controller_index, gp_shoulderl)){
			platdrop_pressed = true;
		}
		else{
			platdrop_pressed = false;
		}
		if(lb_hold && down_hold){
			platdrop_hold = true;
		}
		else{
			platdrop_hold = false;
		}
	
		// Special inputs
		if(down_pressed && !down_hold && forward_pressed){
			down_forward_pressed = buffer_duration;
			down_pressed = 0;
		}
		if(down_pressed && !down_hold && backward_pressed){
			down_backward_pressed = buffer_duration;
			down_pressed = 0;
		}
		if(forward_pressed && !forward_hold && down_pressed){
			forward_down_pressed = buffer_duration;
			forward_pressed = 0;
		}
		if(backward_pressed && !backward_hold && down_pressed){
			backward_down_pressed = buffer_duration;
			backward_pressed = 0;
		}
		if(forward_down_pressed && !down_hold && backward_pressed){
			half_circle_backward_pressed = buffer_duration;
			forward_down_pressed = 0;
			down_pressed = 0;
		}
		if(backward_down_pressed && !down_hold && forward_pressed){
			half_circle_forward_pressed = buffer_duration;
			backward_down_pressed = 0;
			down_pressed = 0;
		}
	}
	// Inputs that read outside of controllability!
	
	// Start
	start_hold = gamepad_button_check(controller_index, gp_start);
	
	// Right stick input
	rs_up = gamepad_axis_value(controller_index, gp_axisrv) < -0.5;
	rs_down = gamepad_axis_value(controller_index, gp_axisrv) > 0.5;
	rs_right = gamepad_axis_value(controller_index, gp_axisrh) > 0.5;
	rs_left = gamepad_axis_value(controller_index, gp_axisrh) < -0.5;
}
	
reset_physics = function(){
	grip = original_grip;
	velocity_friction = 0;
	air_grip = 0;
	weight = original_weight;
	multi_hit_action_index = 0;
	is_collidable = true;
	goes_through_collision = false;
	object_time = 1;
}

action_button_pressed = function(){
	if(x_pressed || y_pressed || b_pressed || lb_pressed || rb_pressed){
		return true;
	}
	return false;
}

check_for_cancel = function(){
	if(can_cancel && cancels > 0
	&& recover_alarm < cancelable_recovery_frames && recover_alarm > 0
	&& action != "Stunned" && !cancel_prevent_hold){
		doing_action_by_canceling = true;
		return true;
	}
	return false;
}

save_current_state = function(){
	last_action = action;
	last_action_alarm = action_alarm;
	last_recover_alarm = recover_alarm;
	last_sprite = sprite_index;
	last_image_index = image_index;
	last_h_velocity = h_velocity;
	last_v_velocity = v_velocity;
	last_grip = grip;
	last_multi_hit_action_index = multi_hit_action_index;
}

do_cancel = function(){
	// Nerf h_velocity so dash cancel is more consistent
	if(abs(h_velocity) > dash_speed*dash_cancel_max_amount && action == "Dash"){
		if(h_velocity > 0){
			h_velocity = dash_speed*dash_cancel_max_amount;
		}
		else{
			h_velocity = -dash_speed*dash_cancel_max_amount;
		}
	}
	recover_alarm = 0;
	cancels -= 1;
	if(global.infinite_cancels_mode){
		cancels = max_cancels;
	}
	can_cancel = false;
	cancel_effect = instance_create_depth(x, y, 1, Eff_Cancel);
	cancel_effect.initiate(self);
}

cancel_the_cancel = function(){
	action = last_action;
	action_alarm = last_action_alarm;
	recover_alarm = last_recover_alarm;
	sprite_index = last_sprite;
	image_index = last_image_index;
	h_velocity = last_h_velocity;
	v_velocity = last_v_velocity;
	grip = last_grip;
	shake_amount = 0;
	multi_hit_action_index = last_multi_hit_action_index;
	instance_destroy(cancel_effect);
}

blink_h = function(x_val, cross_up){
	// Prep
	x_check = 1;
	loops = abs(x_val);
	if(x_val < 0){
		x_check = -1;
	}
	// Moving time
	if(cross_up){
		while(loops > 0 && !place_meeting(x+x_check, y, Parent_Collision)){
			x += x_check;
			loops -= 1;
		}
	}
	else{
		while(loops > 0
		&& !place_meeting(x+x_check, y, Parent_Collision)
		&& !place_meeting(x+x_check, y, Parent_Character)){
			x += x_check;
			loops -= 1;
		}
	}
}

check_collision = function(h_vel = 0, v_vel = 0){
	return collision_rectangle(x-character_width/2+h_vel, y-character_height/2+v_vel, x+character_width/2+h_vel, y+character_height/2+v_vel, Parent_Collision, false, false);
}

platform_check = function(){
	platform = noone;
	if(collision_rectangle(x-character_width/2, y, x+character_width/2, y+character_height/2+v_velocity, Obj_Platform, false, false)){
		platform = collision_rectangle(x-character_width/2, y, x+character_width/2, y+character_height/2+v_velocity, Obj_Platform, false, false);
		if(y+character_height/2 > platform.y+1){ // +1 margin works
			return false;
		}
	}
	return !platdrop_hold && v_velocity >= 0 && platform != noone;
}

ground_check = function(){
	return collision_rectangle(x-character_width/2, y+character_height/2-1, x+character_width/2, y+character_height/2+1, Parent_Collision, false, false) // Slim rectangle check at feet
	|| (!(platdrop_hold && action == noone) && v_velocity >= 0 && collision_rectangle(x-character_width/2, y+character_height/2-1, x+character_width/2, y+character_height/2+1, Obj_Platform, false, false)); // Slim rectangle check at feet
}
