extends Node

var stage = 0

var default_heroes = [
	{
		"name": 'Daivan',
		"health": 100,
		"position": Vector2(50,50),
		"tscn_destination": "res://src/objects/hero/hero_type/hero_normal.tscn"
	},
	{
		"name": 'Daivan 22',
		"health": 200,
		"position": Vector2(100,100),
		"tscn_destination": "res://src/objects/hero/hero_type/hero_normal.tscn"
	}	
]

var heroes = default_heroes

var level_information = {
}

var default_level_information = {
	1:{
		"unlocked": true,
		"high_score": 0,
		"stars_unlocked": 0
		
	}
}

onready var path = 'user://save.dat'
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	level_information = load_data();
	pass # Replace with function body.

func save_data():
	var file = File.new()
	var error = file.open(path, File.WRITE)
	if error!= OK:
		print('Something wrong')
		return
	file.store_var(level_information)
	file.close();
	pass
	
func load_data():
	var file = File.new()
	var err = file.open(path, File.READ)
	if err != OK:
		print('Could not load data')
		return default_level_information
	
	var read = {}
	read = file.get_var()
	return read
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset_game():
	self.heroes = self.default_heroes
	self.stage = 0

func next_stage():
	self.stage = self.stage + 1
