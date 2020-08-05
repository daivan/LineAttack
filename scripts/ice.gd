extends Node2D


export (int) var health


func _ready():
	pass # Replace with function body.

func take_damage(damage):
	health -= damage;
	# can add damage effect here

