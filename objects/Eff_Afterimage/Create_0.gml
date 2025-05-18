event_inherited();

// Cancel effect color
draw_color = c_white;
fade = 0.2;

initiate = function(initiator, color = c_white, alpha = 1, new_fade = 0.2){
	sprite_index = initiator.sprite_index;
	image_index = initiator.image_index;
	image_xscale = initiator.image_xscale;
	image_yscale = initiator.image_yscale;
	image_alpha = alpha;
	fade = new_fade;
	
	draw_color = color;
}