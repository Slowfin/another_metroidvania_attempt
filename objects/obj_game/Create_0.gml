
debug = true

global.temp_enemies_killed = {}
global.permanent_enemies_killed = {}

global.show_hitboxes = false

global.transition = false
global.transition_alpha = 1

trans_room =  0 
trans_x = 0
trans_y = 0
trans_sp = 0.04

image_index_extra = 0
image_index_extra_sp_set = 10
image_index_extra_sp = image_index_extra_sp_set
image_index_extra_max = sprite_get_number(spr_ketchup_bar_full)

	
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
	obj_player.hp = save_data.player.max_hp 
	obj_player.x = save_data.player.pos._x
	obj_player.y = save_data.player.pos._y
	obj_player.ketchup = 1
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