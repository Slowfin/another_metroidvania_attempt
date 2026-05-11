json = 0
image_index_extra = 0
image_index_extra_sp_set = 10
image_index_extra_sp = image_index_extra_sp_set
image_index_extra_max = sprite_get_number(spr_arrow_down)

function save_game() {
	obj_player.hp = obj_player.max_hp
	if !instance_exists(obj_game_save) {
	instance_create_layer(x,y,"Game",obj_game_save)
	}
	global.temp_enemies_killed = {}
	var save_file = {
	last_room: room,
	player: {
		max_hp: obj_player.max_hp,	
		ketchup: obj_player.ketchup,
		pos: { _x: x, _y: y},
	},
	powers: {
		wall_jump: obj_player.pwr_wall_jump,
		dash: obj_player.pwr_dash,
		double_jump: obj_player.pwr_double_jump,
		ride: obj_player.pwr_ride,
		swim: obj_player.pwr_swim,
		ketchup_attack: obj_player.pwr_ketchup_attack
			},
	progress: {
		temp_enemies: global.temp_enemies_killed = {},	
		perm_enemies: global.permanent_enemies_killed,
		walls_broken: global.walls_broken
	}
	
}

json = json_stringify(save_file,true)
var file = file_text_open_write("savegame" + string(global.save_slot_play) + ".sav")
if file != -1 {
	file_text_write_string(file,json)	
	file_text_close(file)
	show_debug_message(json)
} 

}