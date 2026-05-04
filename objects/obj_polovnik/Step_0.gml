if turn_y > 0 {
	y_offset = 8
	x_offset = 0
} else if turn_y < 0 {
	y_offset = 8
	x_offset = 0
} else {
	y_offset = 0
	x_offset = 8
}
x = obj_player.x+(x_offset*turn)
y = obj_player.y+(y_offset*turn_y)