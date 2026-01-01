event_inherited();

// Check for ground
x_check = 32*object_scale*image_xscale;
y_check = 32*object_scale+1;
if(!position_meeting(x+x_check, y+y_check, Parent_Collision) && !position_meeting(x+x_check, y+y_check, Obj_Platform)){
	while(!position_meeting(x+x_check, y+y_check, Parent_Collision) && !position_meeting(x+x_check, y+y_check, Obj_Platform)){
		x -= image_xscale;
	}
	eff = instance_create_depth(x, y, depth, Obj_Boomhand_Shockwave_decay_eff);
	eff.initiate(self);
	instance_destroy();
}

if(effect_counter >= 1){
	eff = instance_create_depth(x, y, depth, Obj_Boomhand_Shockwave_decay_eff);
	eff.initiate(self);
}