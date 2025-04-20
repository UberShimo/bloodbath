event_inherited();

option_width = 64;
option_height = 128;

connection = noone;

clicked = function(clicker){
	// Unpick character
	if(global.is_CPU[index]){
		global.is_CPU[index] = false;
		global.picked_characters[index] = noone;
		clicker.cpu_index = -1;
		clicker.is_picking_for_cpu = false;
		clicker.connection = noone;
		connection = noone;
		
		// Clear portrait
		for(i = 0; i < instance_number(Parent_Preview); i++){
			if(instance_find(Parent_Preview, i).index == index){
				instance_find(Parent_Preview, i).sprite_index = Spr_EMPTY;
			}
		}
	}
	// Time to pick!
	else{
		clicker.cpu_index = index;
		clicker.is_picking_for_cpu = true;
		clicker.connection = self;
		connection = clicker;
		spawn_effect(x+option_width/2, y+option_height/2, 1, Eff_Picker_Rectangle, 1, 0.1, c_white, 1, 1, 0.5, 0, 0);
	}
}