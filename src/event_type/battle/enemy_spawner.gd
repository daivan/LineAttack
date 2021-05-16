extends Node


# Declare member variables here. Examples:
signal all_enemies_dead

# Called when the node enters the scene tree for the first time.
#Load the resourse using preload
const EnemyObject = preload("res://src/objects/enemy/enemy.tscn")

var selected_enemies = [
	{
		"name": 'Daivan',
		"health": 70,
		"position": Vector2(450,50),
		"selected": true,
		"tscn_destination":"res://src/objects/enemy/enemy_type/enemy_goblin.tscn"
	},
	{
		"name": 'Daivan 22',
		"health": 100,
		"position": Vector2(350,50),
		"selected": false,
		"tscn_destination":"res://src/objects/enemy/enemy_type/enemy_star.tscn"
	}	
]

var enemies = [];

func _ready():
	
	# Create a cross node signal
	battle_event_bus.connect("hero_attack", self, "_on_hero_attack");
	
	for selected_enemy in selected_enemies:
		addEnemiesToHolder(selected_enemy);
	

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_hero_attack():
	for enemy in enemies:
		enemy.takeDamage(10,20);
	checkWin();

func areAllEnemiesDead():
	var allDead = true;
	for enemy in enemies:
		if(!enemy.isDead()):
			allDead = false;
	return allDead;
	
	
func checkWin():
	if(areAllEnemiesDead()):
		battle_event_bus.emit_signal("all_enemies_dead")
		print('YOU WIN ALL EENEMIES DEAD!');
		
func _on_grid_found_match(i, j):
	for enemy in enemies:
		if enemy.selected:
			enemy.checkTakeDamage(i, j);
	checkWin();
	pass # Replace with function body.

func addEnemiesToHolder(selected_enemy):
	var EnemyObject = load(selected_enemy.tscn_destination);
	#const EnemyObject = preload(selected_enemy.tscn_destination)
	
	var GrabedInstance = EnemyObject.instance()
	#You could now make changes to the new instance if you wanted
	#Attach it to the tree
	enemies.push_back(GrabedInstance);
	GrabedInstance.position = selected_enemy.position;
	GrabedInstance.health = selected_enemy.health;
	GrabedInstance.selected = selected_enemy.selected;
	GrabedInstance.connectSignal(self);

	self.add_child(GrabedInstance)
	print(GrabedInstance.z_index);

# Signal from enemy when you clicked on a child enemy
func _on_enemy_selecting_enemy():
	print('is it working as it should?');
	for enemy in enemies:
		enemy.selected = false;
		
	
	
