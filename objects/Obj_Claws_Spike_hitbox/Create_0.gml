event_inherited();

startup = generate_sprite_frames(Spr_Claws_Spikerise_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_Spikerise_recovery); // 100% informational not used in logic

damage = 4;
hit_stun = 8;
hit_push = 3;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 2;
v_launch = -3;

swing_sound = Snd_Quick_Swing;
effect = Obj_Claws_Spike_hit_eff;