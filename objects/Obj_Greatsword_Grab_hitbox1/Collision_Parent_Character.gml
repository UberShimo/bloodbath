if(other.index != index){
	// Make sure opponent dont get into wall
	other.x = x;
	x_val = 4*image_xscale;
	repeat(4){
		if(!other.check_collision(x_val, 0)){
			other.x += x_val;
		}
	}
	// Calculate so opponent stay on ground
	y_val = y+(spawner.character_height-other.character_height)/2;
	other.y = y_val;
	other.h_velocity = 0;
	other.v_velocity = 0;
	other.weight = 0;
	other.is_collidable = false;
	
	spawner.weight = 0;
	spawner.h_velocity = 0;
	spawner.v_velocity = 0;
	spawner.action = "Grab Success";
	spawner.sprite_index = Spr_Greatsword_Grab_hit;
	spawner.image_index = 0;
	spawner.action_alarm = 32;
	spawner.recover_alarm = generate_sprite_frames(spawner.sprite_index);
	
	instance_destroy();
}