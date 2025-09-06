event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Life_Pull_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Scythe_Life_Pull_recovery); // 100% informational not used in logic

damage = 13;
hit_stun = global.heavy_hitstun;
hit_push = -8;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = -8;
v_launch = 0;

is_sticky = true;
swing_sound = Snd_Swing1;
hit_sound = Snd_Hit2;

extra_hit_logic = function(target){
	spawner.HP += 13;
	
	if(spawner.HP > spawner.max_HP){
		spawner.HP = spawner.max_HP;
	}
}