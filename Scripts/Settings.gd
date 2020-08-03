extends "res://scripts/base_menu_panel.gd"


signal sound_change
signal back_button




func _on_button1_pressed():
	emit_signal("sound_change")
	pass # Replace with function body.


func _on_button2_pressed():
	emit_signal("back_button")
	pass # Replace with function body.
