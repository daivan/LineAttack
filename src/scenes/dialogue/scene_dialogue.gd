extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var level_to_load

export (String, MULTILINE) var dialogue

export(Array) var dialogue_objects

var dialogue_array = [
	{
		name = "Jack",
		image = "res://src/resources/characters/character1.png",
		position = 'left',
		text = 'WOW WOW Wetiline text'
	},
	{
		name = "daivan",
		image = "res://src/resources/characters/character2.png",
		position = 'right',
		text = 'WOW WOW tiline text 2222'
	},
	{
		name = "Jack",
		image = "res://src/resources/characters/character1.png",
		position = 'left',
		text = 'WOW WOW iline text 3333'
	},					
]

var dialogue_step = 0;
# Called when the node enters the scene tree for the first time.
func _ready():

	display_from_information_from_object(dialogue_array[dialogue_step]);
	pass # Replace with function body.


func _on_TextureButton_pressed():
	
	dialogue_step += 1;
	print(dialogue_step)
	if dialogue_array.size() > dialogue_step:
		display_from_information_from_object(dialogue_array[dialogue_step])
	else:
		print('Show play screen');



func display_from_information_from_object(dialogue):
	# Set the dialogue text
	print(dialogue)
	$RichTextLabel.text = dialogue.text;
	
	$name_background/name_label.text = dialogue.name;
	$character.texture = load(dialogue.image);
	if dialogue.position == 'left':
		$character.flip_h = 0
	else:
		$character.flip_h = 1
