// Check for characters
for(i = 0; i < instance_number(Parent_Character); i++){
	characters[i] = instance_find(Parent_Character, i);
}

// Calculate Biggest and smallest X/Y
biggest_x = 0;
for(i = 0; i < array_length(characters); i++){
	character = instance_find(Parent_Character, i);
	if(character != noone && character.x > biggest_x){
		biggest_x = character.x;
	}
}
smallest_x = biggest_x;
for(i = 0; i < array_length(characters); i++){
	character = instance_find(Parent_Character, i);
	if(character != noone && character.x < smallest_x){
		smallest_x = character.x;
	}
}
biggest_y = 0;
for(i = 0; i < array_length(characters); i++){
	character = instance_find(Parent_Character, i);
	if(character != noone && character.y > biggest_y){
		biggest_y = character.y;
	}
}
smallest_y = biggest_y;
for(i = 0; i < array_length(characters); i++){
	character = instance_find(Parent_Character, i);
	if(character != noone && character.y < smallest_y){
		smallest_y = character.y;
	}
}

// Calculate correct camera width
camera_width = biggest_x+extra_screen_size - (smallest_x-extra_screen_size);
if(camera_width < min_screen_size){
	camera_width = min_screen_size;
}
camera_height = camera_width / global.screen_ratio;

// Calculate camera destination
x_destination = (smallest_x + biggest_x)/2 - camera_width/2;
y_destination = (smallest_y + biggest_y)/2 - camera_height/2 - screen_extra_height;
if(x_destination < 0){
	x_destination = 0;
}
else if(x_destination+camera_width > room_width){
	x_destination = room_width-camera_width;
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
camera_x += random_range(-shake, shake);
camera_y += random_range(-shake, shake);

// Set properties
camera_set_view_size(view_camera[0], camera_width, camera_height);
camera_set_view_pos(view_camera[0], camera_x, camera_y);