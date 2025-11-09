// Must inherit this shit after hitbox is created

hr = instance_create_depth(x, y, 0, hitbox); // Hitbox Reference

damage = hr.damage;
startup = hr.startup;
recovery = hr.recovery;
hit_stun = hr.hit_stun+hr.extra_freeze_duration;
is_projectile = hr.is_projectile;
is_parryable = hr.is_parryable;
is_cancelable = hr.is_cancelable;
is_final = hr.is_final;

instance_destroy(hr);

// Fix some shit
if(hit_stun < 1){
	hit_stun = 0
}

// Initiated afterwards
air_ok = false;
air_only = false;
hold_ok = false;
info = "";
movement_input = Spr_EMPTY;
button_input = Spr_EMPTY;
image = Spr_EMPTY;
extra_image = Spr_EMPTY;
extra_image_x = 0;
extra_image_y = 0;
extra_image_color = c_white;
extra_image_scale = 1;
extra_image_rotation = 0;
frame = 0;
meter_cost = 0;

image_speed = 0;

// Draw variables
input_offset = 24;
digit_offset = 6;

//Outline shader stuff
texel_handle = shader_get_uniform(Shd_Outline, "inTexel");
outline_handle = shader_get_uniform(Shd_Outline, "outlineColor");
outline_color = global.menu_outline_color;