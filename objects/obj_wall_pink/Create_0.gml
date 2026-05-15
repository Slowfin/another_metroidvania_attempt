collide_r = false
collide_l = false
collide_u = false
collide_d = false
collide_rd = false
collide_lu = false
collide_ur = false
collide_dl = false
collide_with = 0
length = 8
length_diag = 9
wall = "pink"
hp = 4
if image_index != 0 {
	autotile = false
}	else {
	autotile = true	
}

id_name = string(room_get_name) + "_" + string(wall) + "_wall_" + string(x) + "_" + string(y)

if global.walls_broken[$ id_name] == true {
	instance_destroy()	
}

