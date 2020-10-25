extends "res://src/interface/base/base_menu_panel.gd"



func _on_ContinueButton_pressed():
	get_tree().reload_current_scene();


func _on_goal_holder_game_won():
	slide_in()
	pass # Replace with function body.


func _on_TextureButton_pressed():
	get_tree().change_scene("res://src/levels/level_select/level_select.tscn");
