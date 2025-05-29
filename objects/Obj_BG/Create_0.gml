depth = 999;
parallax_amount = 0;
parallax_descreaser = 0;
parallax_adjuster = 1;

index = global.BG_index;
// Random BG
if(index == 0){
	index = irandom_range(1, array_length(global.BG_list)-1);
}

BG = global.BG_list[index];

// TRIPPY!!!
if(BG == BG_Trippy){
	show_debug_message("OJJJJ");
	bg_layer = layer_get_id("Background");
	if(layer_exists(bg_layer)){
	    layer_destroy(bg_layer);
	}
}