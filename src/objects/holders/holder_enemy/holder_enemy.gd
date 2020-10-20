extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal all_enemies_dead

# Called when the node enters the scene tree for the first time.
#Load the resourse using preload
const MySmokeResource = preload("res://src/objects/enemy/enemy.tscn")

var enemies = [];

func _ready():
	
	# Create a cross node signal
	var sceen_win = get_tree().get_current_scene().get_node("sceen_win");
	connect("all_enemies_dead", sceen_win, "_on_holder_enemy_all_enemies_dead");
	#Make instance
	var GrabedInstance = MySmokeResource.instance()
	#You could now make changes to the new instance if you wanted
	#Attach it to the tree
	enemies.push_back(GrabedInstance);
	GrabedInstance.position = Vector2(50,50);

	self.add_child(GrabedInstance)
	print(GrabedInstance.z_index);
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func areAllEnemiesDead():
	var allDead = true;
	for enemy in enemies:
		if(!enemy.isDead()):
			allDead = false;
	return allDead;
	
	
func checkWin():
	if(areAllEnemiesDead()):
		emit_signal("all_enemies_dead");
		print('YOU WIN ALL EENEMIES DEAD!');
		
func _on_grid_found_match(i, j):
	for enemy in enemies:
		enemy.checkTakeDamage(i, j);
	checkWin();
	pass # Replace with function body.
