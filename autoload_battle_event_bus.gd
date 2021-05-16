extends Node

# Tell Godot to ignore warnings of unused signals
#warning-ignore:unused_signal

# List of published signals
signal found_match(points)
signal found_match_what(points)

signal enemy_damage

# When enemy attack, the emitters are:
# - res://src/objects/enemy/enemy_factory.gd
signal enemy_attack

# When heroes attack, the emitters are:
# - res://src/event_type/battle/hero_spawner.gd
signal hero_attack

# When all the heroes are dead, the emitters are:
# - res://src/event_type/battle/hero_spawner.gd
signal all_heroes_dead

# When all the enemies are dead, the emitters are:
# - res://src/event_type/battle/enemy_spawner.gd
signal all_enemies_dead

# When player moves block, the emitters are:
# - res://src/event_type/battle/battle_grid.gd
signal move_block

# When player matches blocks, the emitters are:
# - res://src/event_type/battle/battle_grid.gd
signal matched_block

var what = 'Coming from autoload';
