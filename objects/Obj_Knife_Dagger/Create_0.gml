event_inherited();

startup = generate_sprite_frames(Spr_Knife_Mark_Dagger_startup);
recovery = generate_sprite_frames(Spr_Knife_Mark_Dagger_recovery);

damage = 2;
hit_stun = 4;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_impact = global.light_shake_impact;
h_launch = 0;
v_launch = 0;

is_projectile = true;
is_final = true;
projectile_duration = 120;

swing_sound = Snd_Quick_Swing;

collide = function(){
	instance_destroy();
}