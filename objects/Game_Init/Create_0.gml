steam_init();

// Trying to fix bad pixelation
gpu_set_texfilter(false);

// Font time!
draw_set_font(Game_Font);

#region load save
ini_open("save.ini");

// Character unlocks
global.dojo_unlocked = ini_read_real("save", "dojo unlocked", true);
global.katana_unlocked = ini_read_real("save", "katana unlocked", true);
global.claws_unlocked = ini_read_real("save", "claws unlocked", true);
global.boomhand_unlocked = ini_read_real("save", "boomhand unlocked", true);
global.bow_unlocked = ini_read_real("save", "bow unlocked", true);
global.batman_unlocked = ini_read_real("save", "batman unlocked", true);
global.baller_unlocked = ini_read_real("save", "baller unlocked", true);
global.greatsword_unlocked = ini_read_real("save", "greatsword unlocked", true);
global.cultist_unlocked = ini_read_real("save", "cultist unlocked", true);
global.rapier_unlocked = ini_read_real("save", "rapier unlocked", true);
global.knife_unlocked = ini_read_real("save", "knife unlocked", true);
global.shield_unlocked = ini_read_real("save", "shield unlocked", true);
global.scythe_unlocked = ini_read_real("save", "scythe unlocked", true);
global.zombie_unlocked = ini_read_real("save", "zombie unlocked", true);

// Target Run records
global.dojo_TR_record = ini_read_real("save", "dojo TR record", 60*60);
global.katana_TR_record = ini_read_real("save", "katana TR record", 60*60);
global.claws_TR_record = ini_read_real("save", "claws TR record", 60*60);
global.boomhand_TR_record = ini_read_real("save", "boomhand TR record", 60*60);
global.bow_TR_record = ini_read_real("save", "bow TR record", 60*60);
global.batman_TR_record = ini_read_real("save", "batman TR record", 60*60);
global.baller_TR_record = ini_read_real("save", "baller TR record", 60*60);
global.greatsword_TR_record = ini_read_real("save", "greatsword TR record", 60*60);
global.cultist_TR_record = ini_read_real("save", "cultist TR record", 60*60);
global.rapier_TR_record = ini_read_real("save", "rapier TR record", 60*60);
global.knife_TR_record = ini_read_real("save", "knife TR record", 60*60);
global.shield_TR_record = ini_read_real("save", "shield TR record", 60*60);
global.scythe_TR_record = ini_read_real("save", "scythe TR record", 60*60);
global.zombie_TR_record = ini_read_real("save", "zombie TR record", 60*60);

// Music volume
global.max_music_volume = 0.25;
global.music_volume = ini_read_real("save", "music volume", global.max_music_volume);

// Achievements
global.katana_learned = ini_read_real("save", "katana learned", false);
global.claws_learned = ini_read_real("save", "claws learned", false);
global.boomhand_learned = ini_read_real("save", "boomhand learned", false);
global.bow_learned = ini_read_real("save", "bow learned", false);
global.batman_learned = ini_read_real("save", "batman learned", false);
global.baller_learned = ini_read_real("save", "baller learned", false);
global.greatsword_learned = ini_read_real("save", "greatsword learned", false);
global.cultist_learned = ini_read_real("save", "cultist learned", false);
global.rapier_learned = ini_read_real("save", "rapier learned", false);
global.knife_learned = ini_read_real("save", "knife learned", false);
global.shield_learned = ini_read_real("save", "shield learned", false);
global.scythe_learned = ini_read_real("save", "scythe learned", false);
global.zombie_learned = ini_read_real("save", "zombie learned", false);

global.katana_tr_achievement = ini_read_real("save", "katana TR achievement", false);
global.claws_tr_achievement = ini_read_real("save", "claws TR achievement", false);
global.boomhand_tr_achievement = ini_read_real("save", "boomhand TR achievement", false);
global.bow_tr_achievement = ini_read_real("save", "bow TR achievement", false);
global.batman_tr_achievement = ini_read_real("save", "batman TR achievement", false);
global.baller_tr_achievement = ini_read_real("save", "baller TR achievement", false);
global.greatsword_tr_achievement = ini_read_real("save", "greatsword TR achievement", false);
global.cultist_tr_achievement = ini_read_real("save", "cultist TR achievement", false);
global.rapier_tr_achievement = ini_read_real("save", "rapier TR achievement", false);
global.knife_tr_achievement = ini_read_real("save", "knife TR achievement", false);
global.shield_tr_achievement = ini_read_real("save", "shield TR achievement", false);
global.scythe_tr_achievement = ini_read_real("save", "scythe TR achievement", false);
global.zombie_tr_achievement = ini_read_real("save", "zombie TR achievement", false);

ini_close();
#endregion

#region Input binding maps
global.k1_bindings = ds_map_create();
global.k2_bindings = ds_map_create();
global.controller_bindings[0] = ds_map_create();
global.controller_bindings[1] = ds_map_create();
global.controller_bindings[2] = ds_map_create();
global.controller_bindings[3] = ds_map_create();
global.controller_bindings[4] = ds_map_create();
global.controller_bindings[5] = ds_map_create();
global.controller_bindings[6] = ds_map_create();
global.controller_bindings[7] = ds_map_create();
// K1
ds_map_add(global.k1_bindings, "left", ord("A"));
ds_map_add(global.k1_bindings, "right", ord("D"));
ds_map_add(global.k1_bindings, "up", ord("W"));
ds_map_add(global.k1_bindings, "down", ord("S"));
ds_map_add(global.k1_bindings, "jump", ord("W"));
ds_map_add(global.k1_bindings, "dash", vk_shift);
ds_map_add(global.k1_bindings, "meter", vk_space);
ds_map_add(global.k1_bindings, "light attack", ord("H"));
ds_map_add(global.k1_bindings, "medium attack", ord("J"));
ds_map_add(global.k1_bindings, "heavy attack", ord("K"));
ds_map_add(global.k1_bindings, "start", vk_enter);
ds_map_add(global.k1_bindings, "select", vk_backspace);
ds_map_add(global.k1_bindings, "no cancel", ord("Q"));
ds_map_add(global.k1_bindings, "faceback", ord("E"));
// K2
ds_map_add(global.k2_bindings, "left", vk_left);
ds_map_add(global.k2_bindings, "right", vk_right);
ds_map_add(global.k2_bindings, "up", vk_up);
ds_map_add(global.k2_bindings, "down", vk_down);
ds_map_add(global.k2_bindings, "jump", vk_up);
ds_map_add(global.k2_bindings, "dash", vk_numpad6);
ds_map_add(global.k2_bindings, "meter", vk_numpad0);
ds_map_add(global.k2_bindings, "light attack", vk_numpad1);
ds_map_add(global.k2_bindings, "medium attack", vk_numpad2);
ds_map_add(global.k2_bindings, "heavy attack", vk_numpad3);
ds_map_add(global.k2_bindings, "start", vk_enter);
ds_map_add(global.k2_bindings, "select", vk_backspace);
ds_map_add(global.k2_bindings, "no cancel", vk_numpad4);
ds_map_add(global.k2_bindings, "faceback", vk_numpad7);
// Controllers
for(i = 0; i < 8; i++){
	ds_map_add(global.controller_bindings[i], "left", gp_padl);
	ds_map_add(global.controller_bindings[i], "right", gp_padr);
	ds_map_add(global.controller_bindings[i], "up", gp_padu);
	ds_map_add(global.controller_bindings[i], "down", gp_padd);
	ds_map_add(global.controller_bindings[i], "jump", gp_face1);
	ds_map_add(global.controller_bindings[i], "dash", gp_shoulderl);
	ds_map_add(global.controller_bindings[i], "meter", gp_shoulderr);
	ds_map_add(global.controller_bindings[i], "light attack", gp_face3);
	ds_map_add(global.controller_bindings[i], "medium attack", gp_face4);
	ds_map_add(global.controller_bindings[i], "heavy attack", gp_face2);
	ds_map_add(global.controller_bindings[i], "start", gp_start);
	ds_map_add(global.controller_bindings[i], "select", gp_select);
	ds_map_add(global.controller_bindings[i], "no cancel", gp_shoulderrb);
	ds_map_add(global.controller_bindings[i], "faceback", gp_shoulderlb);
}
#endregion

#region settings ish
global.FPS = 60;
global.game_time = 1;
global.screen_ratio = 1.78; // 16:9
global.match_start_timer = 180;
global.is_debugging = false;
global.chaos_mode = false;
global.dojo_mode = false;
global.teams_mode = false;
global.infinite_cancels_mode = false;
global.target_run_mode = false;
global.heart_amount = 4;
global.character_select = Character_Select_1v1;
global.temp_room_save = global.character_select;
global.min_players = 2;
global.max_players = 8; // Actually max controller index check
global.dojo_level = 0; // 0:freeform 1:Basic tutorial 2:Advanced tutorial
global.priority_controller_index = -1;
global.game_just_started = true;
global.k1_used = false;
global.k2_used = false;
#endregion

#region Stats / Colors
global.cancelable_recovery_frames = 22;

global.light_hitstun = 16;
global.light_freeze_duration = 12;
global.light_shake_impact = 1;
global.medium_hitstun = 24;
global.medium_freeze_duration = 16;
global.medium_shake_impact = 2;
global.heavy_hitstun = 32;
global.heavy_freeze_duration = 24;
global.heavy_shake_impact = 4;
global.launcher_hitstun = 48;
global.parry_freeze_duration = 8;

global.slippy_grip = 0.4;
global.standard_grip = 0.5;
global.steady_grip = 0.6;

global.light_weight = 0.5;
global.standard_weight = 0.6;
global.heavy_weight = 0.7;

global.short_height = 48;
global.standard_height = 64;
global.tall_height = 80;

// Player colors
global.standard_outline_color = [0, 0, 0, 1]; // RGB+alpha
global.menu_outline_color = [0, 0, 0, 1]; // RGB+alpha
global.p_colors[0] = make_color_rgb(255, 0, 0);
global.p_colors[1] = make_color_rgb(0, 255, 255);
global.p_colors[2] = make_color_rgb(0, 255, 0);
global.p_colors[3] = make_color_rgb(255, 255, 0);
global.p_colors[4] = make_color_rgb(255, 102, 0);
global.p_colors[5] = make_color_rgb(255, 0, 255);
global.p_colors[6] = make_color_rgb(0, 0, 255);
global.p_colors[7] = make_color_rgb(180, 180, 180);
#endregion

#region Music list
global.music_list = [
	["?????", Snd_NOTHING],
	["Metal Groove", Mu_Metalgroove],
	["Shredded Redemption", Mu_Shred],
	["Dumb n Bass", Mu_Dumb_n_Bass],
	["Orc Ester", Mu_Orc],
	["Dang That's Whapp!", Mu_Dang],
	["Strive", Mu_Strive],
	["Sweet Dirt", Mu_Sweet_Dirt],
	["Blaze Man", Mu_Blaze],
	["Everything Is Alot", Mu_Everything],
	["Deny It Or Not", Mu_Deny_It],
	["Intelligence Killed Us All", Mu_Intelligence],
	["Meaningless Beat", Mu_Meaningless],
	["Close But No Happiness", Mu_Happiness],
	["Sad Monster", Mu_Sad_Monster],
	["Samurai", Mu_Samurai],
	["Temptation And Harmony", Mu_Temptation],
	["Ultravibe", Mu_Ultravibe],
	["Menu Theme", Mu_Anger],
	["Tutorial Theme", Mu_Tutorial],
]
global.battle_music_index = 0;
#endregion

#region BG lists
global.BG_list = [
	BG_Random,
	BG_Mauntains,
	BG_Forest,
	BG_Night,
	BG_Sunset,
	BG_Dungeon,
	BG_Street,
	BG_Trippy,
	BG_Trainingroom
]
// Wall image list
global.wall_images = [
	Spr_Collision,
	Spr_Mauntains_Walls,
	Spr_Forest_Walls,
	Spr_Night_Walls,
	Spr_Sunset_Walls,
	Spr_Dungeon_Walls,
	Spr_Street_Walls,
	Spr_Trippy_Walls,
	Spr_Trainingroom_Walls
]
global.BG_index = 0;
global.BG_darkness = 0.5; // % black
#endregion

#region Arenas
global.arena_list = [
	Dojo_Place,
	Arena_Normal,
	Arena_Extra_Platform,
	Arena_Empty,
	Arena_Small,
	Arena_Hole,
	Arena_Edges,
	Arena_Floors,
	Arena_Isymetrical_Platforms,
	Arena_Highground,
	Arena_Pillar,
	Arena_Side_Holes,
	Arena_Platform_Swarm,
	Arena_Chandelier,
	Arena_Rooms,
	Arena_Higher_Edges
]
global.arena_images = [
	Spr_Random_Layout,
	Spr_Normal_Layout,
	Spr_Extra_Platform_Layout,
	Spr_Empty_Layout,
	Spr_Small_Layout,
	Spr_Hole_Layout,
	Spr_Edges_Layout,
	Spr_Floors_Layout,
	Spr_Isymettrical_Platforms_Layout,
	Spr_Highground_Layout,
	Spr_Pillar_Layout,
	Spr_Side_Holes_Layout,
	Spr_Platform_Swarm_Layout,
	Spr_Chandelier_Layout,
	Spr_Rooms_Layout,
	Spr_Higher_Edges_Layout
]
global.arena_index = 1;
#endregion

// Initiate arrays
for(i = 0; i < 8; i++){
	global.picked_characters[i] = noone;
	global.controller_indexes[i] = -1;
	global.is_CPU[i] = false;
	global.team_change_value[i] = 0;
	global.character_select_x[i] = 0;
	global.character_select_y[i] = 0;
}

// Methods
global.clear_picked_characters = function(){
	for(i = 0; i < 8; i++){
		global.picked_characters[i] = noone;
		global.is_CPU[i] = false;
	}
}

global.reset_controllers = function(index = -1){
	if(index < 0){
		for(i = 0; i < 8; i++){
			global.picked_characters[i] = noone;
			global.controller_indexes[i] = -1;
		}
	}
	else if(index < 8){
			global.picked_characters[index] = noone;
			global.controller_indexes[index] = -1;
	}
}

global.check_if_all_players_ready = function(){
	player_count = 0;
	
	for(i = 0; i < global.max_players; i++){
		if(global.picked_characters[i] != noone){
			player_count += 1;
		}
	}
	
	if(player_count < global.min_players){
		return false;
	}
	
	// Check if all player are not on same team
	if(global.teams_mode){
		found_different_team = false;
		for(i = 0; i < global.max_players; i++){
			if(global.picked_characters[i] != noone){
				for(j = 0; j < player_count; j++){
					if(i+global.team_change_value[i] != j+global.team_change_value[j]){ // loop through index+teamchange and compare it
						found_different_team = true;
					}
				}
			}
		}
		if(!found_different_team){
			return false;
		}
	}
	return true;
}

global.set_standard_controls = function(index = -1){
	// Set all
	if(index < 0){
		ds_map_replace(global.k1_bindings, "left", ord("A"));
		ds_map_replace(global.k1_bindings, "right", ord("D"));
		ds_map_replace(global.k1_bindings, "up", ord("W"));
		ds_map_replace(global.k1_bindings, "down", ord("S"));
		ds_map_replace(global.k1_bindings, "jump", ord("W"));
		ds_map_replace(global.k1_bindings, "dash", vk_shift);
		ds_map_replace(global.k1_bindings, "meter", vk_space);
		ds_map_replace(global.k1_bindings, "light attack", ord("H"));
		ds_map_replace(global.k1_bindings, "medium attack", ord("J"));
		ds_map_replace(global.k1_bindings, "heavy attack", ord("K"));
		ds_map_replace(global.k1_bindings, "no cancel", ord("Q"));
		ds_map_replace(global.k1_bindings, "faceback", ord("E"));

		ds_map_replace(global.k2_bindings, "left", vk_left);
		ds_map_replace(global.k2_bindings, "right", vk_right);
		ds_map_replace(global.k2_bindings, "up", vk_up);
		ds_map_replace(global.k2_bindings, "down", vk_down);
		ds_map_replace(global.k2_bindings, "jump", vk_up);
		ds_map_replace(global.k2_bindings, "dash", vk_numpad6);
		ds_map_replace(global.k2_bindings, "meter", vk_numpad0);
		ds_map_replace(global.k2_bindings, "light attack", vk_numpad1);
		ds_map_replace(global.k2_bindings, "medium attack", vk_numpad2);
		ds_map_replace(global.k2_bindings, "heavy attack", vk_numpad3);
		ds_map_replace(global.k2_bindings, "no cancel", vk_numpad4);
		ds_map_replace(global.k2_bindings, "faceback", vk_numpad7);

		// Controllers
		for(i = 0; i < 8; i++){
			ds_map_replace(global.controller_bindings[i], "left", gp_padl);
			ds_map_replace(global.controller_bindings[i], "right", gp_padr);
			ds_map_replace(global.controller_bindings[i], "up", gp_padu);
			ds_map_replace(global.controller_bindings[i], "down", gp_padd);
			ds_map_replace(global.controller_bindings[i], "jump", gp_face1);
			ds_map_replace(global.controller_bindings[i], "dash", gp_shoulderl);
			ds_map_replace(global.controller_bindings[i], "meter", gp_shoulderr);
			ds_map_replace(global.controller_bindings[i], "light attack", gp_face3);
			ds_map_replace(global.controller_bindings[i], "medium attack", gp_face4);
			ds_map_replace(global.controller_bindings[i], "heavy attack", gp_face2);
			ds_map_replace(global.controller_bindings[i], "no cancel", gp_shoulderrb);
			ds_map_replace(global.controller_bindings[i], "faceback", gp_shoulderlb);
		}
	}
	else if(index == 9){
		ds_map_replace(global.k1_bindings, "left", ord("A"));
		ds_map_replace(global.k1_bindings, "right", ord("D"));
		ds_map_replace(global.k1_bindings, "up", ord("W"));
		ds_map_replace(global.k1_bindings, "down", ord("S"));
		ds_map_replace(global.k1_bindings, "jump", ord("W"));
		ds_map_replace(global.k1_bindings, "dash", vk_shift);
		ds_map_replace(global.k1_bindings, "meter", vk_space);
		ds_map_replace(global.k1_bindings, "light attack", ord("H"));
		ds_map_replace(global.k1_bindings, "medium attack", ord("J"));
		ds_map_replace(global.k1_bindings, "heavy attack", ord("K"));
		ds_map_replace(global.k1_bindings, "no cancel", ord("Q"));
		ds_map_replace(global.k1_bindings, "faceback", ord("E"));
	}
	else if(index == 10){
		ds_map_replace(global.k2_bindings, "left", vk_left);
		ds_map_replace(global.k2_bindings, "right", vk_right);
		ds_map_replace(global.k2_bindings, "up", vk_up);
		ds_map_replace(global.k2_bindings, "down", vk_down);
		ds_map_replace(global.k2_bindings, "jump", vk_up);
		ds_map_replace(global.k2_bindings, "dash", vk_numpad6);
		ds_map_replace(global.k2_bindings, "meter", vk_numpad0);
		ds_map_replace(global.k2_bindings, "light attack", vk_numpad1);
		ds_map_replace(global.k2_bindings, "medium attack", vk_numpad2);
		ds_map_replace(global.k2_bindings, "heavy attack", vk_numpad3);
		ds_map_replace(global.k2_bindings, "no cancel", vk_numpad4);
		ds_map_replace(global.k2_bindings, "faceback", vk_numpad7);
	}
	else if(index < 8){
		ds_map_replace(global.controller_bindings[index], "left", gp_padl);
		ds_map_replace(global.controller_bindings[index], "right", gp_padr);
		ds_map_replace(global.controller_bindings[index], "up", gp_padu);
		ds_map_replace(global.controller_bindings[index], "down", gp_padd);
		ds_map_replace(global.controller_bindings[index], "jump", gp_face1);
		ds_map_replace(global.controller_bindings[index], "dash", gp_shoulderl);
		ds_map_replace(global.controller_bindings[index], "meter", gp_shoulderr);
		ds_map_replace(global.controller_bindings[index], "light attack", gp_face3);
		ds_map_replace(global.controller_bindings[index], "medium attack", gp_face4);
		ds_map_replace(global.controller_bindings[index], "heavy attack", gp_face2);
		ds_map_replace(global.controller_bindings[index], "no cancel", gp_shoulderrb);
		ds_map_replace(global.controller_bindings[index], "faceback", gp_shoulderlb);
	}
}

global.clear_controls = function(index = -1){
	if(index == 9){
		ds_map_replace(global.k1_bindings, "left", -1);
		ds_map_replace(global.k1_bindings, "right", -1);
		ds_map_replace(global.k1_bindings, "up", -1);
		ds_map_replace(global.k1_bindings, "down", -1);
		ds_map_replace(global.k1_bindings, "jump", -1);
		ds_map_replace(global.k1_bindings, "dash", -1);
		ds_map_replace(global.k1_bindings, "meter", -1);
		ds_map_replace(global.k1_bindings, "light attack", -1);
		ds_map_replace(global.k1_bindings, "medium attack", -1);
		ds_map_replace(global.k1_bindings, "heavy attack", -1);
		ds_map_replace(global.k1_bindings, "no cancel", -1);
		ds_map_replace(global.k1_bindings, "faceback", -1);
	}
	else if(index == 10){
		ds_map_replace(global.k2_bindings, "left", -1);
		ds_map_replace(global.k2_bindings, "right", -1);
		ds_map_replace(global.k2_bindings, "up", -1);
		ds_map_replace(global.k2_bindings, "down", -1);
		ds_map_replace(global.k2_bindings, "jump", -1);
		ds_map_replace(global.k2_bindings, "dash", -1);
		ds_map_replace(global.k2_bindings, "meter", -1);
		ds_map_replace(global.k2_bindings, "light attack", -1);
		ds_map_replace(global.k2_bindings, "medium attack", -1);
		ds_map_replace(global.k2_bindings, "heavy attack", -1);
		ds_map_replace(global.k2_bindings, "no cancel", -1);
		ds_map_replace(global.k2_bindings, "faceback", -1);
	}
	else if(index < 8){
		ds_map_replace(global.controller_bindings[index], "left", -1);
		ds_map_replace(global.controller_bindings[index], "right", -1);
		ds_map_replace(global.controller_bindings[index], "up", -1);
		ds_map_replace(global.controller_bindings[index], "down", -1);
		ds_map_replace(global.controller_bindings[index], "jump", -1);
		ds_map_replace(global.controller_bindings[index], "dash", -1);
		ds_map_replace(global.controller_bindings[index], "meter", -1);
		ds_map_replace(global.controller_bindings[index], "light attack", -1);
		ds_map_replace(global.controller_bindings[index], "medium attack", -1);
		ds_map_replace(global.controller_bindings[index], "heavy attack", -1);
		ds_map_replace(global.controller_bindings[index], "no cancel", -1);
		ds_map_replace(global.controller_bindings[index], "faceback", -1);
	}
}
room_goto(Main_Menu);