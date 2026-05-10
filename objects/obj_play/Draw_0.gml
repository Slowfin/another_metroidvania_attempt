if state == "save" {
	draw_sprite(spr_save_selection,-1,160,90)	
} else {
	draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,image_blend,image_alpha)
}	