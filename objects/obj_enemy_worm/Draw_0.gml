draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha)

if global.show_hitboxes == true {
draw_set_alpha(0.5)
draw_set_colour(c_red)
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
draw_set_alpha(1)
}