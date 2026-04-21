event_inherited();

startup = generate_sprite_frames(Spr_Shield_Surf_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Shield_Surf_recovery); // 100% informational not used in logic

damage = 0;
hit_stun = global.heavy_hitstun;
hit_push = 2;
freeze_duration = global.light_freeze_duration;
shake_impact = global.heavy_shake_impact;
h_launch = 2;
v_launch = -2;

is_sticky = true;
is_active = false;
active_frames = recovery; // Actually using recovery in logic... hehe whoops

swing_sound = Snd_NOTHING;
hit_sound = Snd_Hit2;

extra_hit_logic = function(target){
	spawner.h_velocity = 0;
	spawner.v_velocity = 0;
}