extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_level

var level_description_text = 'hejsan';
# Called when the node enters the scene tree for the first time.
func _ready():

	level_description_text = 'Get ready the enemy is\ncomming Kill them';

	$Label.text = level_description_text


func _on_TextureButton_pressed():
	get_node('../second_timer').start();
	
	$AnimationPlayer.play("slide_out");
	emit_signal("start_level");
	pass # Replace with function body.
