event_inherited();

startup = generate_sprite_frames(Spr_Knife_2L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Knife_2L_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = 20;
hit_push = 4;
freeze_duration = global.medium_freeze_duration;
shake_impact = global.medium_shake_impact;
h_launch = 1;
v_launch = -8;

is_sticky = true;
is_launcher = true;
hitfallable = false;

swing_sound = Snd_Light_Swing;