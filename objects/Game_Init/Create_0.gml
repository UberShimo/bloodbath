	
global.FPS = 60;
global.game_time = 1;
global.screen_ratio = 1.78; // 16:9
global.is_debugging = false;
global.chaos_mode = false;
global.dojo_mode = false;
global.heart_amount = 3;
global.arena = Arena_Normal;
global.character_select = Character_Select_1v1;
global.music_volume = 0.3;
global.min_players = 2;
global.max_players = 8; // Actually max controller index check
global.dojo_level = 0; // 0:freeform 1:Basic tutorial 2:Advanced tutorial
global.do_bounce_thing_in_menu = true;
global.priority_controller_index = -1;

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

global.light_weight = 0.55;
global.standard_weight = 0.7;
global.heavy_weight = 0.85;

global.short_height = 48;
global.standard_height = 64;
global.tall_height = 80;

// Player colors
global.p_colors[0] = make_color_rgb(255, 0, 0);
global.p_colors[1] = make_color_rgb(0, 255, 255);
global.p_colors[2] = make_color_rgb(0, 255, 0);
global.p_colors[3] = make_color_rgb(255, 0, 255);
global.p_colors[4] = make_color_rgb(0, 0, 255);
global.p_colors[5] = make_color_rgb(255, 255, 0);
global.p_colors[6] = make_color_rgb(255, 102, 0);
global.p_colors[7] = make_color_rgb(102, 102, 255);
#endregion

// Initiate arrays
for(i = 0; i < 8; i++){
	global.picked_characters[i] = noone;
	global.controller_indexes[i] = -1;
	global.is_CPU[i] = false;
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
	BG_Boxingring,
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
	Spr_Boxingring_Walls,
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

// Methods
global.reset_controllers = function(){
	for(i = 0; i < 8; i++){
		global.picked_characters[i] = noone;
		global.controller_indexes[i] = -1;
	}
}

room_goto(Main_Menu);