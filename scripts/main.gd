extends "res://scripts/base_menu_panel.gd"

signal play_pressed
signal settings_pressed


func _on_button1_pressed():
	emit_signal("play_pressed")

func _on_button2_pressed():
	emit_signal("settings_pressed")

