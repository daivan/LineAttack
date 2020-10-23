extends "res://scripts/base_menu_panel.gd"



func _on_ContinueButton_pressed():
	get_tree().reload_current_scene();


func _on_goal_holder_game_won():
	slide_in()
	pass # Replace with function body.
