event_inherited();

startup = generate_sprite_frames(Spr_Bow_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Bow_ULTRA_recovery);

is_projectile = true;
is_active = false;
is_final = true;

max_speed = 32;
max_duration = 480;
acceleration = 8;
break_power = 2;
v_speed = 2;
target = noone;
turns = 0;
existing_hitbox = noone;

collide = function(){
	move_step();
}