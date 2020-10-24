extends "res://scripts/base_menu_panel.gd"



func _on_ContinueButton_pressed():
	get_tree().reload_current_scene();



func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/level_select_scene.tscn");


# Emit signal coming from holder_enemy
func _on_holder_enemy_all_enemies_dead():
	slide_in()
