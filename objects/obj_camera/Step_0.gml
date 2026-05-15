if x > limit_x2 {
	x = lerp(x,limit_x2,sp)	
} else if x < limit_x1  {
	x = lerp(x,limit_x1,sp)	
} else {
	if set_x == 0 {
		x = lerp(x,obj_player.x,sp)
	} else {
		x = lerp(x,set_x,sp)	
	}
}

if y > limit_y2 {
	y = lerp(y,limit_y2,sp)	
} else if y < limit_y1  {
	y = lerp(y,limit_y1,sp)	
} else {
	if set_y == 0 {
		y = lerp(y,obj_player.y+(vsp_offset*zoom),sp)
	} else {
		y = lerp(y,set_y+(10*zoom),sp)	
	}
}
	

//x = clamp(x,limit_x1+160,limit_x2-160)
//y = clamp(y,limit_y1+90+10,limit_y2-90+16)
x = clamp(x,0+160,room_width-160)
y = clamp(y,0+90+10,room_height-90+16)

if obj_player.vsp > 0 {
	vsp_offset = obj_player.vsp * 2
} else {
	vsp_offset = 0	
}

var shake_x = choose(-shake_power,shake_power) 
var shake_y = choose(-shake_power,shake_power) 

if keyboard_check_pressed(vk_add) {
	zoom_set -= 0.5
}
if keyboard_check_pressed(vk_subtract) {
	zoom_set += 0.5
}
zoom = lerp(zoom,zoom_set,sp)


camera_set_view_pos(view_camera[0],x-(160*zoom)+shake_x,y-(100*zoom)+shake_y)
camera_set_view_size(view_camera[0],320*zoom,180*zoom)

