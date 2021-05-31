extends Control


func _on_Button_pressed():
	reset_game()
	get_tree().change_scene("res://src/levels/level_select/level_select.tscn");
	pass # Replace with function body.

func reset_game():
	game_data_manager.reset_game()
