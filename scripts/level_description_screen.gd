extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_level

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_TextureButton_pressed():
	get_node('../second_timer').start();
	
	$AnimationPlayer.play("slide_out");
	emit_signal("start_level");
	pass # Replace with function body.
