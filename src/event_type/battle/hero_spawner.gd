extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal all_heroes_dead


var selected_heroes = game_data_manager.heroes

var heroes = [];

func _ready():
	
	# Create a cross node signal
	#var game_over_screen = get_tree().get_current_scene().get_node("game_over_screen");
	#connect("all_heroes_dead", game_over_screen, "_on_holder_hero_all_heroes_dead");
	battle_event_bus.connect("enemy_attack", self, "_on_enemy_attack");
	battle_event_bus.connect("matched_block", self, "_on_matched_block");
	
	battle_event_bus.connect("all_enemies_dead", self, "_on_all_enemies_dead");
	
	#Make instance
	for selected_hero in selected_heroes:
		addHeroToHolder(selected_hero);

func _on_all_enemies_dead():
	# Save the health of all heroes to next round
	var i = 0;
	for hero in heroes:
		print(hero.health);
		selected_heroes[i].health = hero.health
		i=i+1
		
	game_data_manager.heroes = selected_heroes
	pass
	
func areAllHeroesDead():
	var allDead = true;
	for hero in heroes:
		if(!hero.isDead()):
			allDead = false;
	return allDead;
	
	
func checkDefeat():
	if(areAllHeroesDead()):
		print('-------------You lose--------------');
		battle_event_bus.emit_signal("all_heroes_dead");
		
func _on_grid_found_match(i, j):
	for hero in heroes:
		hero.checkTakeDamage(i, j);
	checkDefeat();
	pass # Replace with function body.

func addHeroToHolder(selected_hero):
	var heroObject = load(selected_hero.tscn_destination);
	#const EnemyObject = preload(selected_enemy.tscn_destination)

	var Hero = heroObject.instance()
	#You could now make changes to the new instance if you wanted
	#Attach it to the tree
	heroes.push_back(Hero);
	Hero.position = selected_hero.position;
	Hero.health = selected_hero.health;

	self.add_child(Hero)

	pass

func _on_matched_block():
	battle_event_bus.emit_signal("hero_attack")

func _on_enemy_attack():
	_on_enemy_attacking_hero(10)
	
	
func _on_enemy_attacking_hero(attack_power):
	print('are we getting attacked?');
	for hero in heroes:
		hero.takeDamage();
		hero.checkTakeDamage();
	checkDefeat();
