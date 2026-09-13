event_inherited();

damage = 0;
hit_stun = 0;
hit_push = 0;
freeze_duration = 0;
shake_impact = 0;
h_launch = 0;
v_launch = 0;

is_sticky = true;
is_cancelable = true;
is_parryable = false;

swing_sound = Snd_NOTHING;
hit_sound = Snd_NOTHING;
hit_effect_scale = 0;

extra_hit_logic = function(target){
	spawner.marked_target = target;
	instance_destroy();
}
