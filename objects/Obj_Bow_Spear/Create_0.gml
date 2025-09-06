event_inherited();

startup = generate_sprite_frames(Spr_Bow_Spearthrow_startup);
recovery = generate_sprite_frames(Spr_Bow_Spearthrow_recovery);

damage = 25;
hit_stun = global.light_hitstun;
hit_push = 6;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 4;
v_launch = -1;

weight = 0.4;
is_projectile = true;
is_final = true;
projectile_duration = 480; // 8 sec

swing_sound = Snd_Quick_Swing;

// Spear stuff
spd = 0;
attachment = noone;
att_x_dist = 0;
att_y_dist = 0;
original_xscale = 1; // Simply needs to be 1... Not quite sure why
att_original_xscale = 0;
att_angle_diff = 0;
hitbox_list = ds_list_create();

collide = function(){
	h_velocity = 0;
	v_velocity = 0;
	weight = 0;
	is_active = false;
}