extends Node

# Tell Godot to ignore warnings of unused signals
#warning-ignore:unused_signal

# List of published signals
signal found_match(points)
signal found_match_what(points)
signal move_block
signal end_game
signal enemy_damage

# When enemy attack, the emitters are:
#  - res://src/objects/enemy/enemy_factory.gd

signal enemy_attack

var what = 'Coming from autoload';
