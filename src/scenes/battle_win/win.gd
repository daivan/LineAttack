extends Control


func _on_Button_pressed():
	win();
	get_tree().change_scene("res://src/levels/level_select/level_select.tscn");
	pass # Replace with function body.

func win():
	game_data_manager.next_stage()
