extends Node

# Board Variables
export (int) var width
export (int) var height

# Level Variables
export (int) var level
export (int) var unlock_next_level
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
signal update_score_information
signal update_time_information
signal game_lost

# Called when the node enters the scene tree for the first time.
func _ready():
	print(game_data_manager.level_information)
	setup()

func _on_Timer_timeout():
	var level_to_load = "res://src/levels/map/level_map.tscn";
	get_tree().change_scene(level_to_load);
	print('win')

func setup():
	current_time = 0
	current_score = 0
	if game_data_manager.level_information.has(level):
		if game_data_manager.level_information[level].has("high_score"):
			current_high_score = game_data_manager.level_information[level]["high_score"]
	emit_signal("update_score_information", max_score, current_score)
	emit_signal("set_dimensions", width, height)



func _on_grid_update_score(streak_value):
	current_score += streak_value * points_per_piece
	emit_signal("update_score_information", max_score, current_score)
	pass # Replace with function body.


func _on_second_timer_timeout():
	current_time += 1
	emit_signal("update_time_information", time_left, current_time)
	if check_game_lost():
		pass
	pass # Replace with function body.

func check_game_lost() -> bool:
	if game_lost_by_time():
		get_node('../second_timer').stop();
		emit_signal("game_lost");
	return false
	
func game_lost_by_time() -> bool:
	if current_time > time_left:
		return true
	return false
	
func unlock_next_level():

	game_data_manager.level_information[unlock_next_level] = {
		"unlocked": true,
		"high_score": 0,
		"stars_unlocked": 0
	} 
	game_data_manager.save_data();



func _on_goal_holder_game_won():
	unlock_next_level();
	pass # Replace with function body.


func _on_holder_enemy_all_enemies_dead():
	unlock_next_level();
	pass # Replace with function body.
