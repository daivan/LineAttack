extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal selecting_enemy

var health = 50;
var selected = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Create a cross node signal
	var holder_enemy = get_tree().get_current_scene().get_node("holder_enemy");
	connect("selecting_enemy", holder_enemy, "_on_enemy_selecting_enemy");
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.value = self.health;
	$ColorRect.visible = selected
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


func _on_TextureButton_pressed():
	print('touching');
	emit_signal("selecting_enemy");
	selected = true;
	pass # Replace with function body.
