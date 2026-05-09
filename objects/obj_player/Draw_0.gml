draw_sprite_ext(sprite_index,image_index,x,y,sprite_xscale,sprite_yscale,sprite_angle,image_blend,image_alpha)
if pogo {
	draw_sprite_ext(spr_pogo,0,x,y,sprite_xscale,sprite_yscale,sprite_angle,image_blend,image_alpha)	
}

if global.show_hitboxes == true {
draw_set_alpha(0.5)
draw_set_colour(c_blue)
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
draw_set_alpha(1)
}