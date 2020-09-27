extends Node

# Board Variables
export (int) var width
export (int) var height

# Level Variables
export (int) var level
export (bool) var is_moves
export (int) var time_left
var current_time

# Score Variable
var current_high_score
var current_score
export (int) var max_score
export (int) var points_per_piece

# Signals
signal set_dimensions
signal set_score_information
signal set_time_information


# Called when the node enters the scene tree for the first time.
func _ready():
	setup()


func setup():
	current_score = 0
	if game_data_manager.level_information.has(level):
		if game_data_manager.level_information[level].has("high_score"):
			current_high_score = game_data_manager.level_information[level]["high_score"]
	emit_signal("set_score_information", max_score, current_score)
	emit_signal("set_dimensions", width, height)



func _on_grid_update_score(streak_value):
	current_score += streak_value * points_per_piece
	emit_signal("set_score_information", max_score, current_score)
	pass # Replace with function body.
