// Bless you for jumping on boomerang
spawner.cancels = spawner.max_cancels;
spawner.can_cancel = true;
spawner.v_velocity = -8;
	
effect = instance_create_depth(spawner.x, spawner.y, 1, Eff_Cancel);
effect.initiate(spawner);
effect.image_blend = c_aqua;
	
other.v_velocity = 6;
other.is_returning = false;
other.return_alarm = 100;

instance_destroy();