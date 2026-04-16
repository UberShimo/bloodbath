event_inherited();

startup = generate_sprite_frames(Spr_Shield_8F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Shield_8F_whiff); // 100% informational not used in logic

damage = 0;
hit_stun = global.medium_hitstun;
hit_push = 0;
freeze_duration = 2;
shake_impact = 0;
h_launch = 0;
v_launch = 0;

is_sticky = true;

swing_sound = Snd_Quick_Swing;
hit_sound = Snd_NOTHING;

extra_hit_logic = function(target){
	
	// Make sure opponent dont get into wall
	target.x = x;
	target.y = y;
	x_val = 4*image_xscale;
	repeat(6){
		if(!target.check_collision(x_val, 0)){
			target.x += x_val;
		}
	}
	y_val = -4;
	repeat(12){
		if(!target.check_collision(0, y_val)){
			target.y += y_val;
		}
	}
	
	target.h_velocity = 0;
	target.v_velocity = 0;
	target.weight = 0;
	target.is_collidable = false;
	
	spawner.weight = 0;
	spawner.h_velocity = 0;
	spawner.v_velocity = 0;
	spawner.action = "8F Hit";
	spawner.sprite_index = Spr_Shield_8F_hit;
	spawner.image_index = 0;
	spawner.action_alarm = 16;
	spawner.recover_alarm = generate_sprite_frames(spawner.sprite_index);
}