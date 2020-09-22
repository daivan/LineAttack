extends "res://scripts/base_menu_panel.gd"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().change_scene("res://scenes/game_menu.tscn");

func _on_restart_pressed():
	get_tree().reload_current_scene();


func _on_grid_game_over():
	slide_in();
	pass # Replace with function body.


func _on_fail_holder_game_lost():
	slide_in();
	pass # Replace with function body.
