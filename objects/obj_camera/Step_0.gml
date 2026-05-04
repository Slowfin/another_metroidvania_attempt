limit_x1 = 0
limit_x2 = room_width
limit_y1 = 0
limit_y2 = room_height

if set_x == 0 {
x = lerp(x,obj_player.x,sp)
} else {
x = lerp(x,set_x,sp)	
}
if set_y == 0 {
y = lerp(y,obj_player.y+vsp_offset,sp)
} else {
y = lerp(y,set_y+10,sp)	
}
	
x = clamp(x,limit_x1+160,limit_x2-160)
y = clamp(y,limit_y1+90+10,limit_y2-90+16)

if obj_player.vsp > 0 {
	vsp_offset = obj_player.vsp * 2
} else {
	vsp_offset = 0	
}

camera_set_view_pos(view_camera[0],x-160,y-100)
