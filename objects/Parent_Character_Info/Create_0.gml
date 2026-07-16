info = "";
preview1 = Spr_EMPTY;
preview2 = Spr_EMPTY;
preview3 = Spr_EMPTY;
preview4 = Spr_EMPTY;
current_preview = preview1;
preview_image_index = 0;
preview_interval = 120;
preview_alarm = preview_interval;

// Draw variables
digit_offset = 6;
sprite_bg_alpha = 0.1;
sprite_bg_color = c_white;
text_bg_alpha = 0.75;
text_bg_color = c_black;

alarm[0] = 2; // Ugly solution to make sure initiated preview image gets into "current_previw"

//Outline shader stuff
texel_handle = shader_get_uniform(Shd_Outline, "inTexel");
outline_handle = shader_get_uniform(Shd_Outline, "outlineColor");
outline_color = global.menu_outline_color;