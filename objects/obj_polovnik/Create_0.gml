randomize()
x_offset = 0
y_offset = 0
turn_y = sign(obj_player.move_v)
if turn_y > 0 {
	y_offset = 8
	x_offset = 0
	turn = 1
} else if turn_y < 0 {	
	y_offset = 8
	x_offset = 0
	turn = 1
} else {
	y_offset = 0
	x_offset = 8
	turn = obj_player.sprite_turn
}

image_angle = 90 * -turn_y
x = obj_player.x+(x_offset*turn)
y = obj_player.y+(y_offset*turn_y)
image_xscale = 1 * turn
image_yscale = choose(-1,1)
obj_player.attack = true