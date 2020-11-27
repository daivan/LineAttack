extends "res://src/interface/base/base_menu_panel.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().change_scene("res://src/levels/level_select/level_select.tscn");

func _on_restart_pressed():
	get_tree().reload_current_scene();


func _on_grid_game_over():
	slide_in();
	pass # Replace with function body.


func _on_game_manager_game_lost():
	slide_in();	
	pass # Replace with function body.

# signal from holder_hero
func _on_holder_hero_all_heroes_dead():
	slide_in();	
	pass # Replace with function body.
