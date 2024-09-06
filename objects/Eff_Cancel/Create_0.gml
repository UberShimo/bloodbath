event_inherited();

object_time = 1;
logic_time = 1;
fade = 0.02;

initiate = function(initiator){
	sprite_index = initiator.sprite_index;
	image_index = initiator.image_index;
	image_xscale = initiator.image_xscale;
	
	if(initiator.cancels == 1){
		image_blend = c_orange;
	}
	else if(initiator.cancels == 0){
		image_blend = c_red;
	}
	
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, image_blend, 0, 0, 0.25);
}