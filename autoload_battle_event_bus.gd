extends Node

# Tell Godot to ignore warnings of unused signals
#warning-ignore:unused_signal

# List of published signals
signal found_match(points)
signal found_match_what(points)
signal end_game
signal enemy_damage

var what = 'Coming from autoload';
