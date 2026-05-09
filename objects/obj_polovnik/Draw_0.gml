draw_self()
if global.show_hitboxes == true {
draw_set_alpha(0.5)
draw_set_colour(c_white)
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
draw_set_alpha(1)
}