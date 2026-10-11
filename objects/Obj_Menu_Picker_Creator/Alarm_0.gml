show_text = !show_text;
alarm[0]= blink_timer;

if(show_text){
	if(text_index == 0){
		text = "Press (A)";
	}
	else if(text_index == 1){
		text = "Press (A)";
	}
	if(text_index == 2){
		text = "Press (A)";
	}
	else if(text_index == 3){
		text = "Press (A)";
	}
	else if(text_index == 4){
		text = "[SPACE]";
	}
	else if(text_index == 5){
		text = "[SPACE]";
	}
	else if(text_index == 6){
		text = "[Num 0]";
	}
	else if(text_index == 7){
		text = "[Num 0]";
		text_index = -1; // Donnu why -1 works but it does...
	}
	text_index += 1;
}