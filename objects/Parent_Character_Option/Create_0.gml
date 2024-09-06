event_inherited();

character = Obj_Example_Character;
portrait = Spr_Batman_Portrait;
animation = Spr_Batman_Stand;
animation_frame = 0;
animation_speed = 1;
move_list_room = Batman_Move_List;

option_width = 64;
option_height = 128;

mask_index = Spr_Picker;

clicked = function(clicker){
	// Pick for player
	if(clicker.connection == noone){
		if(global.picked_characters[clicker.index] == noone){
			global.picked_characters[clicker.index] = character;
			
			tag = instance_create_depth(clicker.x, clicker.y, depth-1, Obj_Tag);
			tag.index = clicker.index;
			tag.color = global.p_colors[clicker.index];
			clicker.tag = tag;
		}
	}
	// Pick for CPU
	else{
		global.picked_characters[clicker.connection.index] = character;
		global.is_CPU[clicker.connection.index] = true;
		clicker.connection.connection = self;
		clicker.connection = noone;
	}
}