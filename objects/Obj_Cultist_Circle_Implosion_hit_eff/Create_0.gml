event_inherited();

// Has a special initiate
initiate = function(initiator){
	spawner = initiator;
	image_xscale = initiator.image_xscale;
	image_yscale = initiator.image_yscale;
	outline_color = initiator.outline_color;
	
	// BAM
	image_blend = initiator.image_blend;
	
	duration = generate_sprite_frames(sprite_index);
}