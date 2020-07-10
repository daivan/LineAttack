extends Node2D

# State Machine
enum {wait, move}
var state;

# Grid variables
export (int) var width;
export (int) var height;
export (int) var x_start;
export (int) var y_start;
export (int) var offset;
export (int) var y_offset;

# Obsticle Stuff
export (PoolVector2Array) var empty_spaces

# The piece array
var possible_pieces = [
	preload("res://Scenes/yellow_piece.tscn"),
	preload("res://Scenes/blue_piece.tscn"),
	preload("res://Scenes/green_piece.tscn"),
	preload("res://Scenes/red_piece.tscn")
];

# the current pieces in the scene
var all_pieces = [];

# Swap Back Variables
var piece_one = null;
var piece_two = null;
var last_place = Vector2(0,0);
var last_direction = Vector2(0,0);
var move_checked = false;

# Tourch variables
var first_touch = Vector2(0 ,0);
var final_touch = Vector2(0 ,0);
var controlling = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	state = move;
	randomize();
	all_pieces = make_2d_array();
	spawn_pieces();
	
func restricted_movement(place):
	# Check the empty pices
	for i in empty_spaces.size():
		if empty_spaces[i] == place:
			return true;
	return false;
	
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
			if !restricted_movement(Vector2(i,j)):
				# chhose a random number and store it
				var rand = floor(rand_range(0, possible_pieces.size()));
				var piece = possible_pieces[rand].instance();
				var loops = 0;
				while(match_at(i, j, piece.color) && loops < 100):
					rand = floor(rand_range(0, possible_pieces.size()));
					loops += 1;
					piece = possible_pieces[rand].instance();
				# instance that piece from the array
				
				add_child(piece);
				piece.position = grid_to_pixel(i, j);
				all_pieces[i][j] = piece;
			

func match_at(i, j, color):
	
	if i > 1:
		if all_pieces[i - 1][j] != null && all_pieces[i - 2][j] != null:
			if all_pieces[i - 1][j].color == color && all_pieces[i - 2][j].color == color:
				return true;
	if j > 1:
		if all_pieces[i][j - 1] != null && all_pieces[i][j-2] != null:
			if all_pieces[i][j - 1].color == color && all_pieces[i][j - 2].color == color:
				return true;
	return false;

func grid_to_pixel(column, row):
	var new_x = x_start + offset * column;
	var new_y = y_start + -offset * row;
	return Vector2(new_x, new_y);

func pixel_to_grid(pixel_x, pixel_y):
	var new_x = round((pixel_x - x_start) / offset);
	var new_y = round((pixel_y - y_start) / -offset);
	return Vector2(new_x, new_y);
	pass;

func is_in_grid(grid_position):
	if grid_position.x >= 0 && grid_position.x < width:
		if grid_position.y >= 0 && grid_position.y < height:
			return true;
	return false;

func touch_input():
	
	if Input.is_action_just_pressed("ui_touch"):
		if is_in_grid(pixel_to_grid(get_global_mouse_position().x, get_global_mouse_position().y)):
			first_touch = pixel_to_grid(get_global_mouse_position().x, get_global_mouse_position().y);
			controlling = true;
		
	if Input.is_action_just_released("ui_touch"):
		if is_in_grid(pixel_to_grid(get_global_mouse_position().x, get_global_mouse_position().y)) && controlling:
			controlling = false;
			final_touch = pixel_to_grid(get_global_mouse_position().x, get_global_mouse_position().y);
			touch_difference(first_touch, final_touch);
			
			
			
func swap_pieces(column, row, direction):
	var first_piece = all_pieces[column][row];
	var other_piece = all_pieces[column + direction.x][row + direction.y];
	if first_piece != null && other_piece != null:
		store_info(first_piece, other_piece, Vector2(column, row), direction);
		state = wait;
		all_pieces[column][row] = other_piece;
		all_pieces[column + direction.x][row + direction.y] = first_piece;
		first_piece.move(grid_to_pixel(column + direction.x, row + direction.y));
		other_piece.move(grid_to_pixel(column, row));
		if !move_checked:
			find_matches();

func store_info(first_piece, other_piece, place, direction):
	piece_one = first_piece;
	piece_two = other_piece;
	last_place = place;
	last_direction = direction;
	pass;
	

func swap_back():
	# Move the previously swapped pieces back to the previous place
	if piece_one != null && piece_two != null:
		swap_pieces(last_place.x, last_place.y, last_direction);
	state = move;
	move_checked = false;
	pass;
	
func touch_difference(grid_1, grid_2):
	var difference = grid_2 - grid_1;
	if abs(difference.x) > abs(difference.y):
		if difference.x > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(1,0));
		elif difference.x < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(-1,0));
	elif abs(difference.y) > abs(difference.x):
		if difference.y > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0,1));
		elif difference.y < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0,-1));		
		
		
func _process(delta):
	if state == move:
		touch_input();
#	pass

func find_matches():
	for i in width:
		for j in height:
			if all_pieces[i][j] != null:
				var current_color = all_pieces[i][j].color;
				if i> 0 && i < width - 1:
					if all_pieces[i-1][j] != null && all_pieces[i+1][j] != null:
						if current_color == all_pieces[i + 1][j].color && current_color == all_pieces[i - 1][j].color:
							all_pieces[i + 1][j].matched = true;
							all_pieces[i + 1][j].dim();
							all_pieces[i][j].matched = true;
							all_pieces[i][j].dim();
							all_pieces[i - 1][j].matched = true;
							all_pieces[i - 1][j].dim();
				if j> 0 && j < height - 1:
					if all_pieces[i][j+1] != null && all_pieces[i][j-1] != null:
						if current_color == all_pieces[i][j+1].color && current_color == all_pieces[i][j-1].color:
							all_pieces[i][j+1].matched = true;
							all_pieces[i][j+1].dim();
							all_pieces[i][j].matched = true;
							all_pieces[i][j].dim();
							all_pieces[i][j-1].matched = true;
							all_pieces[i][j-1].dim();
							
	get_parent().get_node("destroy_timer").start();
								
	
func destroy_matched():
	var was_matched = false;
	for i in width:
		for j in height:
			if all_pieces[i][j] != null:
				if all_pieces[i][j].matched:
					was_matched = true;
					all_pieces[i][j].queue_free();
					all_pieces[i][j] = null;
	move_checked = true;
	if was_matched:
		get_parent().get_node("collapse_timer").start();
	else:
		swap_back();

func collapse_columns():
	for i in width:
		for j in height:
			if all_pieces[i][j] == null && !restricted_movement(Vector2(i, j)):
				for k in range(j + 1, height):
					if all_pieces[i][k] != null:
						all_pieces[i][k].move(grid_to_pixel(i,j));
						all_pieces[i][j] = all_pieces[i][k];
						all_pieces[i][k] = null;
						break;
	get_parent().get_node("refill_timer").start();
	
func refill_columns():
	for i in width:
		for j in height:
			if all_pieces[i][j] == null && !restricted_movement(Vector2(i, j)):
				var rand = floor(rand_range(0, possible_pieces.size()));
				var piece = possible_pieces[rand].instance();
				var loops = 0;
				while(match_at(i, j, piece.color) && loops < 100):
					rand = floor(rand_range(0, possible_pieces.size()));
					loops += 1;
					piece = possible_pieces[rand].instance();
				# instance that piece from the array
				
				add_child(piece);
				piece.position = grid_to_pixel(i, j - y_offset);
				piece.move(grid_to_pixel(i, j));
				all_pieces[i][j] = piece;	
	after_refill();

func after_refill():
	for i in width:
		for j in height:
			if all_pieces[i][j] != null:
				if match_at(i,j, all_pieces[i][j].color):
					find_matches();
					get_parent().get_node("destroy_timer").start();
					return;
	state = move;
	move_checked = false;

func _on_destroy_timer_timeout():
	destroy_matched();

func _on_collapse_timer_timeout():
	collapse_columns();

func _on_rifill_timer_timeout():
	refill_columns();

