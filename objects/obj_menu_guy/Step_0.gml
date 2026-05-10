if image_yscale != 1 {
	image_yscale = lerp(image_yscale,1,0.1)	
}
if image_xscale != 1 {
	image_xscale = lerp(image_xscale,1,0.1)	
}

if image_yscale < 0.98 {
image_index = 1
} else {
	image_index = 0	
}

if obj_play.state == "menu" {

y = _y

if position_meeting(mouse_x,mouse_y,self) {
	hover = true	
} else {
	hover = false	
}

if hover and mouse_check_button_pressed(mb_left) {
	image_yscale = 0.9
	image_xscale = 1.1
} 

} else {
	y = -200	
}