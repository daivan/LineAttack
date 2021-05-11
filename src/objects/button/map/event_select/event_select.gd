extends Control

export (String) var level_to_load

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	level_to_load = "res://src/event_type/battle/battle.tscn"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_texture_button_pressed():
	get_tree().change_scene(level_to_load);
	print("hejsan")
	pass # Replace with function body.	
