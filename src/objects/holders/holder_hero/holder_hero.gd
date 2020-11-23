extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#Load the resourse using preload
const HeroObject = preload("res://src/objects/hero/hero.tscn")

var selected_heroes = [
	{
		"name": 'Daivan',
		"position": Vector2(50,50)
	},
	{
		"name": 'Daivan 22',
		"position": Vector2(100,50)
	}	
]

var heroes = [];

func _ready():
	#Make instance
	for selected_hero in selected_heroes:
		addHeroToHolder(selected_hero);
	


func areAllHeroesDead():
	var allDead = true;
	for hero in heroes:
		if(!hero.isDead()):
			allDead = false;
	return allDead;
	
	
func checkWin():
	if(areAllHeroesDead()):
		print('YOU WIN ALL EENEMIES DEAD!');
		
func _on_grid_found_match(i, j):
	for hero in heroes:
		hero.checkTakeDamage(i, j);
	checkWin();
	pass # Replace with function body.

func addHeroToHolder(selected_hero):
	var Hero = HeroObject.instance()
	#You could now make changes to the new instance if you wanted
	#Attach it to the tree
	heroes.push_back(Hero);
	Hero.position = selected_hero.position;

	self.add_child(Hero)

	pass
