event_inherited();

fade = 0.01;

// Cancel effect color
draw_color = c_yellow;

initiate = function(initiator){
	sprite_index = initiator.sprite_index;
	image_index = initiator.image_index;
	image_xscale = initiator.image_xscale;
	image_yscale = initiator.image_yscale;
	
	if(initiator.cancels == initiator.max_cancels){
		draw_color = c_aqua;
	}
	else if(initiator.cancels == 1){
		draw_color = c_orange;
	}
	else if(initiator.cancels == 0){
		draw_color = c_red;
	}
	
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.05, draw_color, 0, 0, 0.2);
}