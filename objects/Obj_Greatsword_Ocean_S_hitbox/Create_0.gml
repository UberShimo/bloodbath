event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Ocean_S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Ocean_S_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = 40;
hit_push = 12;
freeze_duration = global.heavy_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 1;
v_launch = -10;

is_sticky = true;
is_launcher = true;

hit_sound = Snd_Hit2;