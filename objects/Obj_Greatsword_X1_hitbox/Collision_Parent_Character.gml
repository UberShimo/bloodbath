if(other.index != index){
	other.x = x+16*image_xscale;
	other.y = y;
	other.h_velocity = 0;
	other.v_velocity = 0;
	other.weight = 0;
	
	spawner.weight = 0;
	spawner.h_velocity = 0;
	spawner.v_velocity = 0;
	spawner.action = "X2";
	spawner.sprite_index = Spr_Greatsword_X_hit;
	spawner.image_index = 0;
	spawner.action_alarm = 32;
	spawner.recover_alarm = generate_sprite_frames(spawner.sprite_index);
	
	instance_destroy();
}