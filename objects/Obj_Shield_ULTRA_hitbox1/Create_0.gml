event_inherited();

startup = generate_sprite_frames(Spr_Shield_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Shield_ULTRA_whiff); // 100% informational not used in logic

damage = 0;
hit_stun = 24;
hit_push = 0;
freeze_duration = 24;
extra_freeze_duration = 24;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_parryable = false;
active_frames = 4;

swing_sound = Snd_Quick_Swing;
hit_sound = Snd_Smack;

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
	
	target.h_velocity = 0;
	target.v_velocity = 0;
	target.weight = 0;
	target.is_collidable = false;
	
	spawner.weight = 0;
	spawner.h_velocity = 0;
	spawner.v_velocity = 0;
	spawner.action = "ULTRA Hit";
	spawner.sprite_index = Spr_Shield_ULTRA_hit;
	spawner.image_index = 0;
	spawner.action_alarm = 24;
	spawner.recover_alarm = generate_sprite_frames(spawner.sprite_index);
	spawner.shake_amount = 8;
}