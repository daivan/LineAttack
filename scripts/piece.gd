extends Node2D

export (String) var color;
var brickScene = preload("res://scenes/breaking_brick.tscn")
var brick

var move_tween;

var matched = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	brick = brickScene.instance()
	add_child(brick)
	brick.setBrickColor(color)
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
	var sprite = brick.brickSprite
	sprite.modulate.a = .9#Color(1,1,1,.3);
	pass;

func destroy():
	brick.destroyBrick()
	brick.z_index=1
