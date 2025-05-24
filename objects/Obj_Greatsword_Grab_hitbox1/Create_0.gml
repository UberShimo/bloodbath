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