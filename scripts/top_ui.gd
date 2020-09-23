extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var score_label = $MarginContainer/HBoxContainer/VBoxContainer/ScoreLabel
onready var counter_label = $MarginContainer/HBoxContainer/VBoxContainer2/CounterLabel
onready var score_bar = $MarginContainer/HBoxContainer/VBoxContainer/TextureProgress
onready var goal_container = $MarginContainer/HBoxContainer/HBoxContainer
onready var timer_label = $MarginContainer/HBoxContainer/VBoxContainer2/TimerLabel

export(PackedScene) var goal_prefab
var current_score = 0;
var current_count = 0;
var current_timer = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_grid_update_score(current_score);
	pass # Replace with function body.

func setup_score_bar(max_score):
	score_bar.max_value = max_score;

func update_score_bar():
	score_bar.value = current_score;

func _on_grid_update_score(amount_to_change):
	current_score += amount_to_change;
	update_score_bar();
	score_label.text = String(current_score);

func make_goal(new_max, new_texture, new_value):
	var current = goal_prefab.instance()
	goal_container.add_child(current)
	current.set_goal_values(new_max, new_texture, new_value);
	
func _on_grid_update_counter(amount_to_change = -1):
	current_count += amount_to_change;
	counter_label.text = String(current_count);
	pass # Replace with function body.


func _on_grid_setup_max_score(max_score):
	setup_score_bar(max_score);
	


func _on_goal_holder_create_goal(new_max, new_texture, new_value):
	make_goal(new_max, new_texture, new_value);
	pass # Replace with function body.


func _on_grid_check_goal(goal_type):
	for i in goal_container.get_child_count():
		goal_container.get_child(i).update_goal_values(goal_type);
	pass # Replace with function body.


func _on_fail_holder_create_fail(fail_timer):
	current_timer = fail_timer;
	timer_label.text = str(current_timer);
	pass # Replace with function body.


func _on_second_timer_timeout():
	current_timer = current_timer - 1;
	timer_label.text = str(current_timer);
	pass # Replace with function body.
