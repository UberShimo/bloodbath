event_inherited();

character = Obj_Dojo;
portrait = Spr_Dojo_Portrait;
animation = Spr_Dojo_Stand;
animation_frame = 0;
animation_speed = 1;
move_list_room = Dojo_Move_List;
target_run_room = Dojo_Target_Run;

option_width = 64;
option_height = 128;

bg_color = c_white;
bg_alpha = 0.1;

mask_index = Spr_Picker;
depth = 10;

//Outline shader stuff
texel_handle = shader_get_uniform(Shd_Outline, "inTexel");
outline_handle = shader_get_uniform(Shd_Outline, "outlineColor");
outline_color = global.menu_outline_color;

clicked = function(clicker){
	// Pick for player
	if(clicker.connection == noone){
		if(global.picked_characters[clicker.index] == noone){
			global.picked_characters[clicker.index] = character;
			
			tag = instance_create_depth(clicker.x, clicker.y, depth-1, Obj_Tag);
			tag.index = clicker.index;
			tag.color = global.p_colors[clicker.index+global.team_change_value[clicker.index]];
			clicker.tag = tag;
			spawn_effect(x+option_width/2, y+option_height/2, 1, Eff_Picker_Rectangle, 1, 0.1, tag.color, 1, 1, 0.5, 0, 0);
			audio_play_sound(Snd_Character_Pick, 0, false);
			
			if(global.target_run_mode){
				clicker.target_run_room = target_run_room;
			}
		}
	}
	// Pick for CPU
	else{
		global.picked_characters[clicker.connection.index] = character;
		global.is_CPU[clicker.connection.index] = true;
		clicker.connection.connection = self;
		clicker.connection = noone;
		clicker.is_picking_for_cpu = false;
		spawn_effect(x+option_width/2, y+option_height/2, 1, Eff_Picker_Rectangle, 1, 0.1, c_white, 1, 1, 0.5, 0, 0);
		audio_play_sound(Snd_Character_Pick, 0, false);
	}
}