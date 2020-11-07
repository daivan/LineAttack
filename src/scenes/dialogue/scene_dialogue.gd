extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var level_to_load

export (String, MULTILINE) var dialogue

# Called when the node enters the scene tree for the first time.
func _ready():
	$RichTextLabel.text = dialogue
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	get_tree().change_scene(level_to_load);
