#region load save
ini_open("save.ini");

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

global.music_volume = ini_read_real("save", "music volume", 1);

ini_close();
#endregion

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
global.heart_amount = 3;
global.character_select = Character_Select_1v1;
global.min_players = 2;
global.max_players = 8; // Actually max controller index check
global.dojo_level = 0; // 0:freeform 1:Basic tutorial 2:Advanced tutorial
global.priority_controller_index = -1;
global.game_just_started = true;

// Font time!
draw_set_font(Game_Font);

#region Stats / Colors
global.cancelable_recovery_frames = 22;

global.light_freeze_duration = 12;
global.light_shake_impact = 1;
global.medium_freeze_duration = 16;
global.medium_shake_impact = 2;
global.heavy_freeze_duration = 24;
global.heavy_shake_impact = 4;

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
global.p_colors[0] = make_color_rgb(255, 0, 0);
global.p_colors[1] = make_color_rgb(0, 255, 255);
global.p_colors[2] = make_color_rgb(0, 255, 0);
global.p_colors[3] = make_color_rgb(255, 255, 0);
global.p_colors[4] = make_color_rgb(255, 102, 0);
global.p_colors[5] = make_color_rgb(255, 0, 255);
global.p_colors[6] = make_color_rgb(0, 0, 255);
global.p_colors[7] = make_color_rgb(102, 102, 255);
#endregion

// Initiate arrays
for(i = 0; i < 8; i++){
	global.picked_characters[i] = noone;
	global.controller_indexes[i] = -1;
	global.is_CPU[i] = false;
	global.team_change_value[i] = 0;
}

#region Music list
global.music_list = [
	["?????", Snd_NOTHING],
	["Metal Groove", Mu_Metalgroove],
	["Shredded Redemption", Mu_Shred],
	["Dumb n Bass", Mu_Dumb_n_Bass],
	["Orc Ester", Mu_Orc],
	["Everything Is Alot", Mu_Everything],
	["Dang That's Whapp!", Mu_Dang],
	["Strive", Mu_Strive],
	["Deny It Or Not", Mu_Deny_It],
	["Blaze Man", Mu_Blaze],
	["Intelligence Killed Us All", Mu_Intelligence],
	["Meaningless Beat", Mu_Meaningless],
	["Close But No Happiness", Mu_Happiness],
	["Sad Monster", Mu_Sad_Monster],
	["Samurai", Mu_Samurai],
	["Sweet Dirt", Mu_Sweet_Dirt],
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
	BG_Boxingring,
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
	Spr_Boxingring_Walls,
	Spr_Trippy_Walls,
	Spr_Trainingroom_Walls
]
global.BG_index = 1;
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
	Arena_Rooms
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
	Spr_Rooms_Layout
]
global.arena_index = 1;
#endregion

// Methods
global.reset_controllers = function(){
	for(i = 0; i < 8; i++){
		global.picked_characters[i] = noone;
		global.controller_indexes[i] = -1;
	}
}

room_goto(Main_Menu);