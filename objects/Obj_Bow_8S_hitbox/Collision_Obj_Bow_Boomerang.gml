// Bless you for jumping on boomerang
spawner.cancels = spawner.max_cancels;
spawner.can_cancel = true;
spawner.v_velocity = -8;
	
effect = instance_create_depth(spawner.x, spawner.y, 1, Eff_Cancel);
effect.initiate(spawner);
	
// Create new boomerang so it can hit opponent again...
new_boomerang = instance_create_depth(other.x, other.y, depth, Obj_Bow_Boomerang);
new_boomerang.swing_sound = Snd_NOTHING;
new_boomerang.initiate(other);
new_boomerang.index = other.index;
new_boomerang.spawner = other.spawner;
new_boomerang.h_velocity = other.h_velocity;
new_boomerang.v_velocity = 6;
new_boomerang.is_returning = false;
new_boomerang.return_alarm = 20;
new_boomerang.lift_amount = other.lift_amount;

instance_destroy(other);
instance_destroy();