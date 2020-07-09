extends Node2D


# Grid variables
export (int) var width;
export (int) var height;
export (int) var x_start;
export (int) var y_start;
export (int) var offset;

var possible_pieces = [
	preload("res://scenes/yellow_piece.tscn"),
	preload("res://scenes/blue_piece.tscn"),
	preload("res://scenes/green_piece.tscn"),
	preload("res://scenes/red_piece.tscn")
];


var all_pieces = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	all_pieces = make_2d_array();
	spawn_pieces();
	

func make_2d_array():
	var array = [];
	for i in width:
		array.append([]);
		for j in height:
			array[i].append(null);
			
	return array;

func spawn_pieces():
	for i in width:
		for j in height:
			# chhose a random number and store it
			var rand = floor(rand_range(0, possible_pieces.size()));
			# instance that piece from the array
			var piece = possible_pieces[rand].instance();
			add_child(piece);
			piece.position = grid_to_pixel(i, j);
			

func grid_to_pixel(column, row):
	var new_x = x_start + offset * column;
	var new_y = y_start + -offset * row;
	return Vector2(new_x, new_y);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
