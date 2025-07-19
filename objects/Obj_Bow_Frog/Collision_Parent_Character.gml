if(has_jumped && other.index != spawner.index && !has_bitten){
	has_bitten = true;
	weight = 0;
	h_velocity = 0
	v_velocity = 0;
	sprite_index = Spr_Bow_Frog_Bite;
	hitbox = instance_create_depth(x, y, 0, Obj_Bow_Frog_Bite_hitbox);
	hitbox.initiate(spawner);
	destroy_alarm = generate_sprite_frames(sprite_index);
}