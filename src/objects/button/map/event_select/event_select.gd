extends Control

export (int) var stage

enum EVENT_TYPE { battle = 0, shop = 1, event = 2 }
export(EVENT_TYPE) var event_type = EVENT_TYPE.battle

var event_to_load
var enabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Check if global step is higher than set step, if so enable
	self.enabled = false
	if game_data_manager.stage == self.stage:
		self.enabled = true

	if self.enabled == true:
		get_node("texture_button").set_normal_texture(load("res://src/resources/graphics/interface/greenbutton.png"));
	else:
		get_node("texture_button").set_normal_texture(load("res://src/resources/graphics/interface/redbutton.png"));
	
	if self.event_type == 0:
		self.event_to_load = "res://src/event_type/battle/battle.tscn"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_texture_button_pressed():
	if self.enabled == true:
		get_tree().change_scene(self.event_to_load);
		
	pass # Replace with function body.	
