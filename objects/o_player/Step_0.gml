var my_speed = 3;
var xx = 0;
var yy = 0;

var up = keyboard_check(vk_up);
var down = keyboard_check(vk_down);
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var fire = keyboard_check_pressed(vk_space);

// Movement
if (right) {
	xx = x + my_speed;
	image_angle = 0;
}

if (left) {
	xx = x - my_speed;
	image_angle = 180;
}

if (up) {
	yy = y - my_speed;
	image_angle = 90;
}

if (down) {
	yy = y + my_speed;
	image_angle = 270;
}

if (xx != 0) {
	x = xx;
}

if (yy != 0) {
	y = yy;
}

if (fire) {
	var b = instance_create_layer(x, y, "Instances", o_bullet);
	b.direction = image_angle;
}