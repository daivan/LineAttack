extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	#main menu panel active
	$Main.slide_in()



func _on_Main_settings_pressed():
	$Main.slide_out()
	$Settings.slide_in()
	


func _on_Settings_back_button():
	$Main.slide_in()
	$Settings.slide_out()


func _on_Main_play_pressed():
	get_tree().change_scene("res://scenes/game.tscn");
	pass # Replace with function body.


func _on_Main_play_time_attack_pressed():
	get_tree().change_scene("res://scenes/time_attack.tscn");
	print('hejsan');
	#get_tree().change_scene("");
	pass # Replace with function body.
