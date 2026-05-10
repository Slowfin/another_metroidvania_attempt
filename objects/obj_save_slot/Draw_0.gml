draw_set_font(fnt_pixel)
if obj_play.state == "save" {
	draw_self()
	draw_set_colour(c_white)
	draw_set_halign(fa_center)
	draw_text(x,y-58,"save slot " +string(save_slot))
	if !file_exists("savegame" + string(save_slot) + ".sav") {
		draw_text(x,y,"NEW GAME")
	} else {
		draw_text_transformed(x,y,"welcome back~",0.65,0.65,0)
	}

}