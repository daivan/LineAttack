extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ice_pieces = [];
var width = 8;
var height = 10;
var ice = preload("res://Scenes/ice.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func make_2d_array():
	var array = [];
	for i in width:
		array.append([]);
		for j in height:
			array[i].append(null);
			
	return array;

func _on_grid_make_ice(board_position):
	if ice_pieces.size() == 0:
		ice_pieces = make_2d_array();
	var current = ice.instance();
	add_child(current);
	current.position = Vector2(board_position.x * 64 +  64 , -board_position.y * 64 + 800)
	ice_pieces[board_position.x][board_position.y] = current

func _on_grid_damage_ice(board_position):
	if ice_pieces[board_position.x][board_position.y] != null:
		ice_pieces[board_position.x][board_position.y].take_damage(1);
		if ice_pieces[board_position.x][board_position.y].health <= 0:
			ice_pieces[board_position.x][board_position.y].queue_free();
			ice_pieces[board_position.x][board_position.y] = null;

