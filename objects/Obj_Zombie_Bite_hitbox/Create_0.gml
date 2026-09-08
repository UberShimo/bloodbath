event_inherited();

startup = generate_sprite_frames(Spr_Zombie_Bite_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Zombie_Bite_recovery); // 100% informational not used in logic

damage = 15;
hit_stun = global.medium_hitstun;
hit_push = 0;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_parryable = false;
active_frames = 8;

hit_sound = Snd_Hit2;
hit_effect_scale = 2;
hit_effect_color = c_red;

extra_hit_logic = function(target){
	spawner.HP += damage;
}