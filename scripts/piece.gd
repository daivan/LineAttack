extends Node2D

export (String) var color;

var move_tween;

var matched = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	move_tween = get_node("move_tween");
	pass # Replace with function body.

func move(target):
	move_tween.interpolate_property(self, "position", position, target, .3, Tween.TRANS_ELASTIC, Tween.EASE_OUT);
	move_tween.start();
	pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func dim():
	var sprite = get_node("Sprite");
	sprite.modulate = Color(1,1,1,.5);
	pass;
