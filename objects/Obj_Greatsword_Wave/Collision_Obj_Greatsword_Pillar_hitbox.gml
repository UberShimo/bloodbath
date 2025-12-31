// Looks if value exists in list. If not it returns -1
if(ds_list_find_index(pillar_list, other) == -1){
	if(other.image_xscale > 0){
		image_xscale = object_scale;
		h_velocity = abs(h_velocity)*object_scale;
	}
	else{
		image_xscale = -object_scale;
		h_velocity = abs(h_velocity)*-object_scale;
	}
	v_velocity = -4.2; // Just to get up on platforms
	
	ds_list_add(pillar_list, other);
}