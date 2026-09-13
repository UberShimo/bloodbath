event_inherited();

damage = 3;
hit_stun = global.medium_hitstun;
hit_push = 2;
freeze_duration = 4;
shake_impact = global.medium_shake_impact;
h_launch = 1;
v_launch = -2;

is_sticky = true;

swing_sound = Snd_Light_Swing;

extra_hit_logic = function(target){
	if(spawner.v_velocity > 0){
		spawner.v_velocity = 0;
	}
}