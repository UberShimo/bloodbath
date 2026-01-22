event_inherited();

startup = generate_sprite_frames(Spr_Bow_Aim_Up_startup);
recovery = generate_sprite_frames(Spr_Bow_Aim_Up_recovery);

damage = 10;
hit_stun = global.light_hitstun;
hit_push = 3;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 2;
v_launch = -1;

is_projectile = true;
is_cancelable = true;
projectile_duration = 120;
has_hit_boomerang = false;

swing_sound = Snd_Quick_Swing;

// Arrow stuff
spd = 0;
hitbox_list = ds_list_create();

collide = function(){
	instance_destroy();
}