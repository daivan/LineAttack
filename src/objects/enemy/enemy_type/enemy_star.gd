extends "res://src/objects/enemy/enemy_factory.gd"
#extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 50;
	selected = false
	attackTimer = 5;
	attackTimerStep = 5;
	attack_power = 5;
	parent = Node;
	# Create a cross node signal to hero_spawner
	#var hero_spawner = get_tree().get_root().get_node("hero_spawner");
	#connect("attacking_hero", hero_spawner, "_on_enemy_attacking_hero", [attack_power]);
	
	pass # Replace with function body.



#	pass
func checkTakeDamage(i, j):
	# Take damage
	self.takeDamage(i, j);

func takeDamage(i, j):
	print('taking damage');
	self.health = self.health - 10;
	isDead();
	
func isDead():
	if(health<1):
		return true

func tempDisplayHealth():
	print(health);

func _on_take_damage():
	print('signaling taking data from autoload');

func _on_TextureButton_pressed():
	print('touching');
	#battle_event_bus.emit_signal("found_match_what", 30);

	selected = true;
	pass # Replace with function body.

func connectSignal(parent):
	# Create a cross node signal
	#print(battle_event_bus.what);
	#battle_event_bus.connect("enemy_damage", self, "_on_take_damage");
	pass
