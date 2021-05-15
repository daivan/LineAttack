extends "res://src/objects/hero/hero_factory.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 50
	
	battle_event_bus.connect("move_block", self, "_on_move_block");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.value = self.health;

func checkTakeDamage():
	# Take damage
	self.takeDamage();

func takeDamage():
	self.health = self.health - 30;
	isDead();
	
func isDead():
	if(health<1):
		return true
