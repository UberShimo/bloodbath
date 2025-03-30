// Stick to ball
if(ball != noone){
	x = ball.x;
	y = ball.y;
	
	if(ball.h_velocity > 0){
		image_xscale = 1;
	}
	else if(ball.h_velocity < 0){
		image_xscale = -1;
	}
}