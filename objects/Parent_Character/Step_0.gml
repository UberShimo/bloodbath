// Always make sure there is a closest enemy before executing code
find_closest_enemy(); // Also needs to be here if a player dies after "Begin Step".

event_inherited();

if(is_respawning){
	visible = false;
	x = Obj_Respawner.x;
	y = Obj_Respawner.y;
	h_velocity = 0;
	v_velocity = 0;
}

// Are you close to a wall? Just used for character collision logic when close to walls so you dont clip through it
check_length = 2;
if(collision_rectangle(x-character_width/2-check_length, y-character_height/2,
x+character_width/2+check_length, y+character_height/2, Parent_Collision, false, false)){
	is_close_to_wall = true;
}
else{
	is_close_to_wall = false;
}

#region alarms  V-----V
if(action_alarm > 0){
	action_alarm -= logic_time;
	
	if(action_alarm <= 0){
		action_trigger();
	}
}

if(jump_alarm > 0){
	jump_alarm -= logic_time;
	
	if(jump_alarm <= 0){
		v_velocity = -jump_power;
		
		if(forward_hold && h_velocity*image_xscale < jump_control){
			h_velocity = jump_control*image_xscale;
		}
		else if(backward_hold && h_velocity*image_xscale > -jump_control){
			h_velocity = -jump_control*image_xscale;
		}
	}
}

if(mini_jump_disabled_alarm > 0){
	mini_jump_disabled_alarm -= logic_time;
	
	if(mini_jump_disabled_alarm <= 0){
		mini_jump_disabled = false;
	}
}

// Parry duration count down in real time
if(parry_alarm > 0){
	parry_alarm -= 1;
	
	if(parry_alarm <= 0){
		is_parrying = false;
		shake_amount = 0;
	}
}

if(recover_alarm > 0){
	recover_alarm -= logic_time;
	
	if(recover_alarm <= 0){
		sprite_index = stand_spr;
		recover_alarm = 0;
		action_alarm = 0;
		action = noone;
		is_unstoppable = false;
		
		reset_physics();
		can_cancel = false;
	}
}

if(death_alarm > 0){
	death_alarm -= global.game_time;
	
	if(death_alarm <= 0){
		death_alarm = 0;
		
		hearts -= 1;
		// Blood / respawn effect
		spawn_effect(x, y, 12, Eff_Blood, 1, 0.05, c_white, 3, 4);
		spawn_effect(x, y, 8, Eff_Splash, 1, 0.1, c_red, 2, 4);
		spawn_effect(x, y, 1, Eff_Faded_Ring, 1, 0.2, c_red, 0, 0, 2);
		
		if(hearts > 0){
			respawn_alarm = 120;
			is_controllable = false;
			is_invincible = true;
			is_respawning = true;
			
			// Clear hitbox list
			ds_list_clear(hitbox_list);
		}
		Obj_Match_Manager.check_for_winner();
	}	
}

if(respawn_alarm > 0){
	respawn_alarm -= global.game_time;
	
	// Can respawn early.
	// Ugly input read needed cuz you are not controllable by normal means
	if(respawn_alarm <= 0 ||
	(gamepad_button_check_pressed(controller_index, gp_face1)
	&& respawn_alarm < 60)){
		respawn_alarm = 0;
		is_respawning = false;
		
		visible = true;
		is_controllable = true;
		is_invincible = true;
		invincibility_alarm = 60;
		
		reset_physics();
		face_closest_enemy();
		read_input();
		
		ugly_down = gamepad_button_check(controller_index, gp_padd)
		|| gamepad_axis_value(controller_index, gp_axislv) > 0.5;
		ugly_right = gamepad_button_check(controller_index, gp_padr)
		|| gamepad_axis_value(controller_index, gp_axislh) > 0.5;
		ugly_left = gamepad_button_check(controller_index, gp_padl)
		|| gamepad_axis_value(controller_index, gp_axislh) < -0.5;
		
		if(is_CPU){
			ugly_down = false;
			ugly_right = false;
			ugly_left = false;
			rng = irandom_range(0, 2);
			
			if(rng == 0){ // 33%
				ugly_right = true;
			}
			else if(rng == 1){ // 33%
				ugly_left = true;
			}
		}
		
		h_velocity = 0;
		v_velocity = -4;
		if(ugly_down){
			v_velocity = 4;
		}
		if(ugly_right){
			h_velocity = 4;
		}
		else if(ugly_left){
			h_velocity = -4;
		}
		HP = max_HP;
	}
}

if(invincibility_alarm > 0){
	invincibility_alarm -= logic_time;
	
	if(invincibility_alarm <= 0){
		invincibility_alarm = 0;
		
		is_invincible = false;
		image_alpha = 1;
	}
}

if(priority_struck_alarm > 0){
	priority_struck_alarm -= logic_time;
	
	if(priority_struck_alarm <= 0){
		priority_struck_alarm = 0;
		
		priority_struck = false;
	}
}

// Might aswell be poison alarm...
if(DoT_alarm > 0){
	DoT_alarm -= logic_time;
	HP -= DoT_tick_dmg*logic_time;
	
	if(effect_counter >= 1){
		spawn_effect(x, y, 1, Eff_Dot, 1, 0.1, c_lime, 0.2, 0.5, 0, 0, 0, character_width, depth-1);
	}
	
	if(HP <= 0){
		HP = 0;
		DoT_alarm = 0;
		DoT_tick_dmg = 0;
	}
}
#endregion

#region control V-----V
// Movement
if(action == noone){
	// Crouch
	if(down_hold){
		// nothing lol
	}
	// Forward
	else if(forward_hold){
		if(grounded){
			if(abs(h_velocity) < start_speed){
				h_velocity = start_speed*image_xscale;
			}
			if(abs(h_velocity) < max_speed){
				h_velocity += (grip+acceleration)*image_xscale*logic_time;
			}
			// Gain meter by moving toward opponent
			if(!closest_enemy.is_respawning && closest_enemy != self && !faceback_hold && !global.target_run_mode){
				meter += meter_gain_by_approaching*logic_time;
			}
		}
		else if(abs(h_velocity) < max_speed){
			// air_control*2 because it is also the grip variable
			h_velocity += (air_control*2)*image_xscale*logic_time;
		}
	}
	// Backward
	else if(backward_hold){
		if(grounded){
			if(abs(h_velocity) < start_speed){
				h_velocity = -start_speed*image_xscale;
			}
			if(abs(h_velocity) < max_speed){
				h_velocity += -(grip+acceleration)*image_xscale*logic_time;
			}
		}
		else if(abs(h_velocity) < max_speed){
			// air_control*2 because it is also the grip variable
			h_velocity += -(air_control*2)*image_xscale*logic_time;
		}
	}
	// Jump
	if(a_pressed){
		reset_physics();
		a_pressed = 0; // Just reset A buffer
		
		if(grounded){
			action = "Jump";
			sprite_index = jump_spr;
			jump_alarm = jump_startup;
			action_alarm = jump_startup; // Important since if(action_alarm == 0) ---> action = noone
		}
		else if(extra_jumps_left > 0){
			extra_jumps_left -= 1;
			v_velocity = -jump_power*extra_jump_strength;
		}
	}	
}
// Jump cancel
else if(a_pressed && (extra_jumps_left > 0 || grounded) && check_for_cancel()){
	reset_physics();
	a_pressed = 0; // Just reset A buffer
	
	if(grounded){
		action = "Jump";
		sprite_index = jump_spr;
		jump_alarm = jump_startup;
		action_alarm = jump_startup; // Important since if(action_alarm == 0) ---> action = noone
	}
	else if(extra_jumps_left > 0){
		action = noone;
		extra_jumps_left -= 1;
		v_velocity = -jump_power*extra_jump_strength;
	}
	
	do_cancel();
	// Gotta reset this shit
	doing_action_by_canceling = false;
}
// Short jump
if(action == noone && !mini_jump_disabled && v_velocity < -jump_power*mini_jump_power && !a_hold){
	v_velocity = -jump_power*mini_jump_power;
}
// Clip through platform when dropping through it
if(platdrop_pressed && action == noone
&& collision_rectangle(x-character_width/2, y+character_height/2-1, x+character_width/2, y+character_height/2+1, Obj_Platform, false, false)){
	while(collision_rectangle(x-character_width/2, y+character_height/2-1, x+character_width/2, y+character_height/2+1, Obj_Platform, false, false)){
		y += 1;
	}
}
#endregion

#region physics V-----V

// Move outa wall
if(is_in_wall){
	max_distance = 12;
	distance_count = 0;
	dir = point_direction(colliding_wall.x, colliding_wall.y, x, y);
	while(check_collision()){
		x += lengthdir_x(1, dir);
		y += lengthdir_y(1, dir);
		distance_count += 1;
		if(distance_count >= max_distance){
			break;
		}
	}
}

// H velocity
val = h_velocity*logic_time;
// Check collision with rectangle
if(!check_collision(val, 0) || goes_through_collision){
	x += val;
}
// Collide logic
else{
	x_check = 1;
	if(val < 0){
		x_check = -1;
	}
	while(!check_collision(x_check, 0)){
		x += x_check;
	}
	// Wall bounce
	if(action == "Stunned" && abs(h_velocity) > wall_bounce_limit){
		h_velocity = -h_velocity*0.25;
		spawn_effect(x, y, 8, Eff_Splash, 1, 0.05);
		
		if(v_velocity > -10){
			v_velocity = -10;
		}
	}
}

// Grip logic
val = 0;
if(air_grip > 0){
	val = air_grip*logic_time;
}
else if(grounded){
	val = grip*logic_time;
}
else if(action == noone){
	val = air_control*logic_time;
}

if(h_velocity > val){
	h_velocity -= val;
}
else if(h_velocity < -val){
	h_velocity += val;
}
else{
	h_velocity = 0;
}

// V velocity
val = v_velocity*logic_time;

if((!check_collision(0, val) && !platform_check()) || goes_through_collision){
	y += val;
	
	// Gravity
	if(!grounded && v_velocity < max_fall_speed){
		val = weight*logic_time;
		
		// Just to add some float
		if(abs(v_velocity) < jump_power/8){
			val /= 2;
		}
		v_velocity += val;
	}
	
}
// Snap to roof
else if(v_velocity < 0){
	y = floor(y);
	while(!check_collision(0, -1)){
		y -= 1;
	}
	y += 1; // For safety
	v_velocity = -v_velocity*0.1;
}
// Snap to ground
else{
	y = floor(y);
	while(!ground_check()){
		y += 1;
	}
	
	// Ground bounce
	if(action == "Stunned" && v_velocity > ground_bounce_limit){
		v_velocity = -v_velocity*0.5;
		spawn_effect(x, y, 8, Eff_Splash, 1, 0.05);
	}
	// Land
	else{
		if(is_unstable){
			action = "Unstable Landing";
			sprite_index = land_spr;
			recover_alarm += action_alarm+1;
		}
		v_velocity = 0;
	}
}
// Grounded or not? also reset cancels
if(ground_check() && v_velocity >= 0){
	grounded = true;
	
	if(action == noone){
		cancels = max_cancels;
		extra_jumps_left = extra_jumps;
	}
}
else{
	grounded = false;
}
#endregion

#region sprite fix  V-----V
image_speed = logic_time;
image_angle = 0;

if(action == noone){
	if(grounded){
		face_closest_enemy(); // Not sprite related but...
		
		if(down_hold){
			sprite_index = crouch_spr;
		}
		else if(forward_hold){
			sprite_index = forward_spr;
		}
		else if(backward_hold){
			sprite_index = backward_spr;
		}
		else{
			// Pose?
			if(rs_up || rs_down || rs_right || rs_left){
				if(rs_up && sprite_index != pose2_spr){
					sprite_index = pose2_spr;
					image_index = 0;
				}
				else if(rs_down && sprite_index != pose3_spr){
					sprite_index = pose3_spr;
					image_index = 0;
				}
				else if(!rs_up && !rs_down && sprite_index != pose1_spr){
					sprite_index = pose1_spr;
					image_index = 0;
				}
				// Face correct
				if(rs_right){
					image_xscale = 1;
				}
				else if(rs_left){
					image_xscale = -1;
				}
			}
			// Stand...
			else{
				sprite_index = stand_spr;
			}
		}
	}
	else{
		if(v_velocity < 0){
			sprite_index = ascend_spr;
		}
		else{
			sprite_index = descend_spr;
		}
	}
}
else if(action == "Stunned" && !grounded){
	sprite_index = launched_spr;
	
	// Must be actually moving to change your image. Otherwise it looks like you lay down in air while still.
	if(abs(h_velocity) > 0 && abs(v_velocity) > 0){
		image_angle = point_direction(0, 0, h_velocity, v_velocity);
		image_angle -= 90; // Rotate image correctly
	}
	
	if(h_velocity < 0){ // face right way
		image_xscale = 1;
	}
	else if(h_velocity > 0){
		image_xscale = -1;
	}
}

// Decide face
if(instance_number(Parent_Character) == 1){
	face_index = 3;
}
else if(HP <= 0){
	face_index = 2;
}
else if(action == "Stunned"){
	face_index = 1;
}
else{
	face_index = 0;
}
#endregion

#region buffer subtraction V-----V
forward_pressed--;
backward_pressed--;
right_pressed--;
left_pressed--;
down_pressed--;
a_pressed--;
b_pressed--;
x_pressed--;
y_pressed--;
lb_pressed--;
rb_pressed--;
down_forward_pressed--;
forward_down_pressed--;
half_circle_forward_pressed--;
down_backward_pressed--;
backward_down_pressed--;
half_circle_backward_pressed--;
double_down_pressed--;
meter_dash_lb_pressed--;
meter_dash_rb_pressed--;
#endregion

#region universal moves V-----V
// Meter dash
if(meter_dash_lb_pressed > 0 && meter_dash_rb_pressed > 0
&& (forward_hold || backward_hold) && meter >= 50){
	reset_buffers();
	meter_dash_lb_pressed = 0;
	meter_dash_rb_pressed = 0;
	meter -= 50;
	cancels = 0;
	
	// Undo normal dash
	if(action == "Dash"){
		if(instance_exists(cancel_effect)){
			instance_destroy(cancel_effect);
		}
	}
	else if(backward_hold){
		sprite_index = dash_backward_spr;
		h_velocity = -dash_speed*image_xscale;
		blink_h(-dash_blink*image_xscale, true);
	}
	else{
		sprite_index = dash_forward_spr;
		h_velocity = dash_speed*image_xscale;
		blink_h(dash_blink*image_xscale, true);
	}
	image_index = 0;
	
	action = "Meter Dash";
	is_collidable = false;
	is_invincible = true;
	grip = dash_grip;
	air_grip = dash_grip;
	v_velocity = dash_lift;
	weight = original_weight/4;
	action_alarm = 0;
	recover_alarm = 24;
	invincibility_alarm = 24;
}
// Parry / Dash
// Awful amount of checks just to be able to pay cancels when dashing in air
else if(lb_pressed > 0 && !down_hold
&& ((action == noone && grounded || (action == "ULTRA" && action_alarm > 0))
|| check_for_cancel()
|| (!grounded && cancels > 0 && action == noone))){
	read_input();
	lb_pressed = 0; // Just reset LB buffer
	is_unstoppable = false; // Actually just for Boomhand ultra cancel...
	
	// Also cancel if its just an air dash
	if(doing_action_by_canceling || (!grounded && (forward_hold || backward_hold))){
		do_cancel();
	}
	
	// Dashes
	if(forward_hold || backward_hold){
		if(backward_hold){
			sprite_index = dash_backward_spr;
			h_velocity = -dash_speed*image_xscale;
			blink_h(-dash_blink*image_xscale, true);
		}
		else{
			sprite_index = dash_forward_spr;
			h_velocity = dash_speed*image_xscale;
			blink_h(dash_blink*image_xscale, true);
			
			// Gain meter when dashing toward enemy
			if(!closest_enemy.is_respawning && closest_enemy != self && !global.target_run_mode){
				// Extra check so you really dash towards enemy!
				if((closest_enemy.x > x && image_xscale > 0)
				|| (closest_enemy.x < x && image_xscale < 0)){
					meter += meter_gain_by_dashing;
				}
			}
		}
	
		action = "Dash";
		can_cancel = true;
		is_collidable = false;
		grip = dash_grip;
		air_grip = dash_grip;
		weight = original_weight/4;
		v_velocity = dash_lift;
		recover_alarm = dash_duration;
	}
	// Parry
	else if(grounded && !platdrop_hold){
		action = "Parry";
		
		is_parrying = true;
		shake_amount = 2;
		sprite_index = parry_spr;
		image_index = 0;
		
		parry_alarm = parry_active_frames;
		recover_alarm = parry_duration;
	}
	// Gotta reset this shit
	doing_action_by_canceling = false;
	image_index = 0;
}
// Meter control
if(meter > max_meter){
	meter = max_meter;
}
#endregion

// Fully charged effect
if(meter == 100 && effect_counter >= 1){
	spawn_effect(x, y, 1, Eff_Fade_Ray, 1, 0, c_lime, 1, 2, 0, 0, 360, 0, 1);
}

// Can respawn effect
if(respawn_alarm > 0 && respawn_alarm < 60 && effect_counter >= 1){
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.05, c_lime, 0.1, 0.3, 0, 0, 360, 24);
}

// Invincible effects
if(is_invincible && is_controllable){
	image_alpha = 0.25;
	if(effect_counter >= 1){
		spawn_effect(x, y, 1, Eff_Ring, 1, 0.05, c_lime, 0.1, 0.3, 0, 0, 360, 24);
	}
}

// Exit
if(start_hold){
	exit_count += 1;
	if(exit_count >= exit_count_goal){
		room_goto(global.character_select);
	}
}
else{
	exit_count = 0;
}

// Reset target run
if(global.target_run_mode && rs_down && is_controllable){
	room_restart();
}

// Die!!!
if(HP <= 0 && death_alarm <= 0 && !is_respawning){
	die();
}