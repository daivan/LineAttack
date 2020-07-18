extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var score_label = $MarginContainer/HBoxContainer/VBoxContainer/ScoreLabel
onready var counter_label = $MarginContainer/HBoxContainer/CounterLabel
onready var score_bar = $MarginContainer/HBoxContainer/VBoxContainer/TextureProgress
var current_score = 0;
var current_count = 0;

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



func _on_grid_update_counter(amount_to_change = -1):
	current_count += amount_to_change;
	counter_label.text = String(current_count);
	pass # Replace with function body.


func _on_grid_setup_max_score(max_score):
	setup_score_bar(max_score);
	
