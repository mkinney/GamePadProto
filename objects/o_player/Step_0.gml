var my_speed = 3;
var xx = 0;
var yy = 0;

var up = keyboard_check(vk_up) 
			or gamepad_button_check(0, gp_padu);
var down = keyboard_check(vk_down) 
			or gamepad_button_check(0, gp_padd);
var left = keyboard_check(vk_left) 
			or gamepad_button_check(0, gp_padl);
var right = keyboard_check(vk_right) 
			or gamepad_button_check(0, gp_padr);
var fire = keyboard_check_pressed(vk_space) 
			or gamepad_button_check_pressed(0, gp_shoulderr) 
			or gamepad_button_check_pressed(0, gp_shoulderrb);
			
	
// virtual keys
if (mouse_check_button(mb_left) and (o_virtual_arrows.show)) {
	
	// check for virtual arrow
	var va = instance_position(mouse_x, mouse_y, o_virtual_arrow);
	if (va != noone) {
		switch (va.dir) {
			case "left":
				left = 1;
				break;
			case "right":
				right = 1;
				break;
			case "up":
				up = 1;
				break;
			case "down":
				down = 1;
				break;	
		}
	}
}

// virtual button
if (device_mouse_check_button_pressed(0, mb_left)) {
	
	// check for virtual button
	var vb = instance_position(mouse_x, mouse_y, o_virtual_button);
	if (vb != noone) and (o_virtual_arrows.show) {
		fire = 1;
	}
	
	// show/hide virtual arrows/button (toggle)
	var p = instance_position(mouse_x, mouse_y, o_player);
	if (p != noone) {
		o_virtual_arrows.show = ! o_virtual_arrows.show
	}
}

// movement
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