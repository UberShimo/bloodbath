
character_amount = instance_number(Parent_Character);

// Calculate Biggest and smallest X/Y
biggest_x = 0;
for(i = 0; i < character_amount; i++){
	character = instance_find(Parent_Character, i);
	if(character.object_index != Obj_Target && character.x > biggest_x){
		biggest_x = character.x;
	}
}
smallest_x = biggest_x;
for(i = 0; i < character_amount; i++){
	character = instance_find(Parent_Character, i);
	if(character.object_index != Obj_Target && character.x < smallest_x){
		smallest_x = character.x;
	}
}
biggest_y = 0;
for(i = 0; i < character_amount; i++){
	character = instance_find(Parent_Character, i);
	if(character.object_index != Obj_Target && character.y > biggest_y){
		biggest_y = character.y;
	}
}
smallest_y = biggest_y;
for(i = 0; i < character_amount; i++){
	character = instance_find(Parent_Character, i);
	if(character.object_index != Obj_Target && character.y < smallest_y){
		smallest_y = character.y;
	}
}

// Adjust camera size... In a very smooth way!
target_width = biggest_x+extra_screen_width - (smallest_x-extra_screen_width);

if(target_width < min_screen_size){
	target_width = min_screen_size;
}
else if(target_width > max_screen_size){
	target_width = max_screen_size;
}
if(camera_width < target_width){
	if(camera_width + camera_resize_speed > target_width){
		camera_width = target_width;
	}
	else{
		camera_width += camera_resize_speed;
	}
}
if(camera_width > target_width){
	if(camera_width - camera_resize_speed < target_width){
		camera_width = target_width;
	}
	else{
		camera_width -= camera_resize_speed;
	}
}
camera_height = camera_width / global.screen_ratio;

// Calculate camera destination
x_destination = (smallest_x + biggest_x)/2 - camera_width/2;
y_destination = (smallest_y + biggest_y)/2 - camera_height/2;
if(x_destination < 0){
	x_destination = 0;
}
else if(x_destination+camera_width > room_width){
	x_destination = room_width-camera_width;
}

// Extra camera height
y_destination -=  screen_extra_height;

// Make sure players at bottom are visible
while(y_destination < biggest_y - camera_height + screen_extra_bottom){
	y_destination += 1;
}

// Make sure camera dont go too far below
while(y_destination + camera_height >  room_height + max_screen_below_room_amount){
	y_destination -= 1;
}

// Move camera to destination
distance = point_distance(camera_x, camera_y, x_destination, y_destination);
if(distance <= camera_speed){
	camera_x = x_destination;
	camera_y = y_destination;
}
else{
	dir = point_direction(camera_x, camera_y, x_destination, y_destination);
	camera_x += lengthdir_x(camera_speed, dir);
	camera_y += lengthdir_y(camera_speed, dir);
}

// Shake
camera_x += irandom_range(-shake, shake);
camera_y += irandom_range(-shake, shake);

// Set properties. Uses floor() to reduce wierd pixel scaling.
camera_set_view_size(view_camera[0], floor(camera_width), floor(camera_height));
camera_set_view_pos(view_camera[0], floor(camera_x), floor(camera_y));

// Initiate camera at center of all characters
if(!camera_position_is_initiated){
	camera_position_is_initiated = true;
	camera_x = x_destination;
	camera_y = y_destination;
}