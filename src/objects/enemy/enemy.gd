extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health = 50;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.value = self.health;
#	pass
func checkTakeDamage(i, j):
	# Take damage
	self.takeDamage(i, j);

func takeDamage(i, j):
	self.health = self.health - 10;
	isDead();
	
func isDead():
	if(health<1):
		return true

func tempDisplayHealth():
	print(health);
