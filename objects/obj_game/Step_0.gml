cursor_sprite = spr_cursor
window_set_caption("жоперный омега чпоньк")
if keyboard_check_pressed(vk_f11) {
		fullscreen = !fullscreen
		window_set_fullscreen(fullscreen)
} 
if keyboard_check_pressed(vk_f10) {
		global.show_hitboxes = !global.show_hitboxes
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
	if !file_exists("savegame.sav") { 
		show_debug_message("сохранение не найдено :(")	
		return false
	}
	
	 var buff = buffer_load("savegame.sav")
    if buff == -1 {
		return false
		 }
		 
        var json_string = buffer_read(buff,buffer_string)
		 
		 
		show_debug_message("прочитано: " + json_string)
        buffer_delete(buff)
		
	save_data = json_parse(json_string)
	
	global.transition = false
	global.transition_alpha = 1
	obj_player.hp = save_data.player.max_hp 
	obj_player.x = save_data.player.pos._x
	obj_player.y = save_data.player.pos._y
	obj_player.pwr_wall_jump = save_data.powers.wall_jump
	obj_player.pwr_dash = save_data.powers.dash
	obj_player.pwr_double_jump = save_data.powers.double_jump
	obj_player.pwr_ride = save_data.powers.ride
	obj_player.pwr_swim = save_data.powers.swim
	obj_player.ketchup = obj_player.ketchup_max
	 room_goto(save_data.last_room)
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