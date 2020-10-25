extends "res://src/interface/base/base_menu_panel.gd"

signal play_pressed
signal settings_pressed
signal play_time_attack_pressed

func _on_button1_pressed():
	emit_signal("play_pressed")

func _on_button2_pressed():
	emit_signal("settings_pressed")
