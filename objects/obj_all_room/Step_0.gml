cursor_sprite = spr_cursor
window_set_caption("жоперный омега чпоньк")
if keyboard_check_pressed(vk_f11) {
		fullscreen = !fullscreen
		window_set_fullscreen(fullscreen)
} 
if keyboard_check_pressed(vk_f2) {
		global.show_hitboxes = !global.show_hitboxes
} 
if keyboard_check_pressed(vk_f1) {
		global.debug = !global.debug
} 