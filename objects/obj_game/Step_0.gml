
if keyboard_check_pressed(vk_escape) {
	room_goto(main_menu)
	
}

image_index_extra_sp -= 1 
if image_index_extra_sp <= 0 {
	image_index_extra_sp = image_index_extra_sp_set
	image_index_extra += 1
}

if image_index_extra > image_index_extra_max {
	image_index_extra = 0	
}

// LOAD
//function save_load() {
//	//if !file_exists("savefile.sav") {
//	//	show_debug_message("не найдено :(")
//	//	return false
//	//}
//	show_debug_message("========== ЗАГРУЗКА ==========")
//	if !file_exists("savegame.sav") { 
//		show_debug_message("сохранение не найдено :(")	
//		return false
//	}
	
//	 var file = file_text_open_read("savegame.sav")
//    if file == -1 {
//		return false
//		 }
		 
//        var json_string = file_text_read_string(file);
		 
		 
//		show_debug_message("прочитано: " + json_string)
//        file_text_close(file) 
		
//	save_data = json_parse(json_string)
		 
//	 obj_player.hp = save_data.player.hp 
//	 obj_player.x = save_data.player.pos._x
//	 obj_player.y = save_data.player.pos._y
//	 room_goto(save_data.last_room)
//	 show_debug_message(json)
//	 return true
//	} 
	
function save_load() {
	//if !file_exists("savefile.sav") {
	//	show_debug_message("не найдено :(")
	//	return false
	//}
	show_debug_message("========== ЗАГРУЗКА ==========")
	if !file_exists("savegame" + string(global.save_slot_play) + ".sav") { 
		show_debug_message("сохранение не найдено :(")	
		return false
	}
	
	 var buff = buffer_load("savegame" + string(global.save_slot_play) + ".sav")
    if buff == -1 {
		return false
		 }
		 
        var json_string = buffer_read(buff,buffer_string)
		 
		 
		show_debug_message("прочитано: " + json_string)
        buffer_delete(buff)
		
	save_data = json_parse(json_string)
	
	global.transition = false
	global.transition_alpha = 1
	room_goto(save_data.last_room)
	if !instance_exists(obj_player) {
	instance_create_layer(save_data.player.pos._x,save_data.player.pos._y,"Player",obj_player)
	}
	obj_player.max_hp = save_data.player.max_hp 
	obj_player.hp = obj_player.max_hp
	obj_player.x = save_data.player.pos._x
	obj_player.y = save_data.player.pos._y
	obj_player.ketchup = save_data.player.ketchup
	obj_player.pwr_wall_jump = save_data.powers.wall_jump
	obj_player.pwr_dash = save_data.powers.dash
	obj_player.pwr_double_jump = save_data.powers.double_jump
	obj_player.pwr_ride = save_data.powers.ride
	obj_player.pwr_swim = save_data.powers.swim
	obj_player.state = states_player.normal
	obj_player.vsp = 0
	obj_player.hsp = 0
	obj_player.ride = false
	global.temp_enemies_killed = {}
	 return true
	} 
	

if keyboard_check_pressed(ord("O")) {
	save_load()	
}

// room trans
if global.transition == true {
obj_player.cant_move = true
obj_player.hsp = 0
obj_player.vsp = 0
global.transition_alpha += trans_sp
} else if global.transition == false  {
obj_player.cant_move = false
global.transition_alpha -= trans_sp
}	


if global.transition_alpha >= 1 and global.transition == true {
	global.transition = false	
	if instance_exists(obj_polovnik) {
		with obj_polovnik {
			instance_destroy()
		}	
	}
	room_goto(trans_room)
	obj_player.x = trans_x
	obj_player.y = trans_y
	obj_player.attack = false

}

global.transition_alpha = clamp(global.transition_alpha,0,1)