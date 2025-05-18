event_inherited();

if(spike_alarm > 0){
	spike_alarm -= logic_time;
	
	if(spike_alarm <= 0){
		snap_to_ground();
		spike = instance_create_depth(x, y, depth+1, Obj_Claws_Spike_hitbox);
		spike.image_xscale *= spike_size;
		spike.image_yscale *= spike_size;
		spike.initiate(self);
		spike_size *= spike_grow;
		spikes_left -= 1;
		if(spikes_left <= 0){
			instance_destroy();
		}
		x += spike_distance*image_xscale;
		spike_alarm = spike_delay;
	}
}