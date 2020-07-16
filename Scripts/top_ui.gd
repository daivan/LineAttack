extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var score_label = $MarginContainer/HBoxContainer/ScoreLabel

var current_score = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_grid_update_score(current_score);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_grid_update_score(amount_to_change):
	current_score += amount_to_change;
	score_label.text = String(current_score);

