
	
scr_keybinds()
if place_meeting(x,y,obj_player) and key_down {
	obj_player.hp = obj_player.max_hp
	var save_file = {
	last_room: room,
	player: {
		max_hp: obj_player.max_hp,	
		pos: { _x: x, _y: y},
	},
	powers: {
		wall_jump: false,
		dash: false,
		double_jump: false,
		ride: true,
		swim: false	
			},
	progress: {
		temp_enemies: global.temp_enemies_killed = {},	
		perm_enemies: global.permanent_enemies_killed = {}	
	}
	
}

json = json_stringify(save_file,true)
var file = file_text_open_write("savegame.sav")
if file != -1 {
	file_text_write_string(file,json)	
	file_text_close(file)
	show_debug_message(json)
}

}	

image_speed = 2

image_index_extra_sp -= 1 
if image_index_extra_sp <= 0 {
	image_index_extra_sp = image_index_extra_sp_set
	image_index_extra += 1
}

if image_index_extra > image_index_extra_max {
	image_index_extra = 0	
}