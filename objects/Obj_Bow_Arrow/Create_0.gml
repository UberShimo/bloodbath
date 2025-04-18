event_inherited();

startup = generate_sprite_frames(Spr_Bow_Aim_Up_startup);
recovery = generate_sprite_frames(Spr_Bow_Aim_Up_recovery);

damage = 12;
hit_stun = 16;
hit_push = 5;
freeze_duration = 8;
h_launch = 1;
v_launch = -4;

is_projectile = true;
is_cancelable = true;
projectile_duration = 120;

swing_sound = Snd_Light_Swing;

spd = 0;
hitbox_list = ds_list_create();

collide = function(){
	instance_destroy();
}