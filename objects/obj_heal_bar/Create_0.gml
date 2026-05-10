randomise()
stick = instance_create_layer(x-10,y,"Game",obj_heal_bar_stick)
trigger = 1
success = 0

if y < obj_camera.limit_y1 {
	y = obj_player.y + 18	
}

_y = y
y = y + 4

