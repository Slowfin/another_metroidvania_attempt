// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_keybinds(){

key_right = keyboard_check(vk_right)
key_left = keyboard_check(vk_left)
key_down = keyboard_check(vk_down)
key_up = keyboard_check(vk_up)
key_jump = keyboard_check_pressed(ord("Z"))
key_jump_long = keyboard_check(ord("Z"))
key_jump_release = keyboard_check_released(ord("Z"))
key_dash = keyboard_check_pressed(ord("C"))
key_ride = keyboard_check_pressed(ord("D"))
key_pogo = keyboard_check_pressed(ord("P"))
key_attack = keyboard_check_pressed(ord("X"))
key_heal = keyboard_check_pressed(ord("A"))
key_attack_ketchup = keyboard_check_pressed(ord("S"))

}