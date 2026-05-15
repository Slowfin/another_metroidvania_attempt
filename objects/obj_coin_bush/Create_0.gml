hp = 3
break_snd = snd_bush_break
broken_snd = snd_bush_broken
coin_drop = random_range(15,20)

id_name = string(room_get_name) + "_bush_" + string(x) + "_" + string(y)

if global.walls_broken[$ id_name] == true {
	instance_destroy()	
}