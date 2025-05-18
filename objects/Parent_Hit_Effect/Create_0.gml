event_inherited();

spawner = noone;
duration = 0;

initiate = function(initiator){
	spawner = initiator;
	image_xscale = initiator.image_xscale;
	image_yscale = initiator.image_yscale;
	
	duration = generate_sprite_frames(sprite_index);
}