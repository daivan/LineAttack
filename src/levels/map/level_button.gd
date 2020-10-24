extends Node2D

export (int) var level
export (String) var level_to_load
export (bool) var enabled 
export (bool) var score_goal_met

export (Texture) var blocked_texture
export (Texture) var open_texture
export (Texture) var goal_met
export (Texture) var goal_not_met

onready var level_label = $TextureButton/Label
onready var button = $TextureButton
onready var start = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	if game_data_manager.level_information.has(level):
		enabled = game_data_manager.level_information[level]['unlocked'];
	setup();


func setup():
	level_label.text = String(level)
	if enabled:
		button.texture_normal = open_texture
	else:
		button.texture_normal = blocked_texture
	if score_goal_met:
		start.texture = goal_met
	else:
		start.texture = goal_not_met
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	if enabled:
		get_tree().change_scene(level_to_load);
	pass # Replace with function body.
