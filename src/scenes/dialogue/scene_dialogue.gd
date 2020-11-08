extends CanvasLayer

export (String) var level_to_load

export(String) var global_dialogue_to_load

var dialogue_array = [];
var dialogue_step = 0;


func _ready():
	
	dialogue_array = GLOBAL_DIALOGUE.dialogue_array[global_dialogue_to_load];
	

func _on_TextureButton_pressed():
	
	dialogue_step += 1;
	print(dialogue_step)
	if dialogue_array.size() > dialogue_step:
		display_from_information_from_object(dialogue_array[dialogue_step])
	elif dialogue_array.size() == dialogue_step:
		$play.show();
	else:
		get_tree().change_scene(level_to_load);



func display_from_information_from_object(dialogue):
	# Set the dialogue text
	$RichTextLabel.text = dialogue.text;
	
	$name_background/name_label.text = dialogue.name;
	$character.texture = load(dialogue.image);
	if dialogue.position == 'left':
		$character.flip_h = 0
	else:
		$character.flip_h = 1
