event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Grab_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Grab_whiff); // 100% informational not used in logic

damage = 0;
hit_stun = 1;
hit_push = 0;
freeze_duration = 1;
shake_impact = 0;
h_launch = 0;
v_launch = 0;

is_parryable = false;
is_sticky = true;
is_final = true;
extra_freeze_duration = 60;

swing_sound = Snd_Quick_Swing;
hit_sound = Snd_Knack;

extra_hit_logic = function(target){
	
	// Make sure opponent dont get into wall
	target.x = x;
	x_val = 4*image_xscale;
	repeat(4){
		if(!target.check_collision(x_val, 0)){
			target.x += x_val;
		}
	}
	// Calculate so opponent stay on ground
	y_val = y+(spawner.character_height-target.character_height)/2;
	target.y = y_val;
	target.h_velocity = 0;
	target.v_velocity = 0;
	target.weight = 0;
	target.is_collidable = false;
	
	spawner.weight = 0;
	spawner.h_velocity = 0;
	spawner.v_velocity = 0;
	spawner.action = "Grab Success";
	spawner.sprite_index = Spr_Greatsword_Grab_hit;
	spawner.image_index = 0;
	spawner.action_alarm = 32;
	spawner.recover_alarm = generate_sprite_frames(spawner.sprite_index);
}