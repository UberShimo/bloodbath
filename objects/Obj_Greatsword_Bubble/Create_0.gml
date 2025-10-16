event_inherited();

damage = 2;
hit_stun = 8;
hit_push = 0;
freeze_duration = global.light_freeze_duration;
shake_amount = global.light_shake_impact
h_launch = 0;
v_launch = 0;

is_projectile = true;
projectile_duration = random_range(90, 240);
velocity_friction = 0.1;

swing_sound = Snd_NOTHING;
hit_sound = Snd_NOTHING;

// Buuble stuff
image_xscale = 0.25;
image_yscale = 0.25;
image_blend = c_aqua;
