event_inherited();

startup = generate_sprite_frames(Spr_Knife_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_5S_recovery); // 100% informational not used in logic

damage = 19;
hit_stun = 28;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;

swing_sound = Snd_Light_Swing;
hit_sound = Snd_Hit2;

extra_hit_logic = function(target){
	// Extra dmg if target is marked
	if(target == spawner.marked_target){
		spawner.marked_target = noone;
		damage *= 2; // Double damage!
	}
}