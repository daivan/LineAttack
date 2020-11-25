extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal selecting_enemy
signal attacking_hero

var health = 50;
var selected = false;

var attackTimer = 5;
var attackTimerStep = 5;
var attack_power = 5;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Create a cross node signal
	var holder_enemy = get_tree().get_current_scene().get_node("holder_enemy");
	connect("selecting_enemy", holder_enemy, "_on_enemy_selecting_enemy");
	
	# Create a cross node signal to holder_hero
	var holder_hero = get_tree().get_current_scene().get_node("holder_hero");
	connect("attacking_hero", holder_hero, "_on_enemy_attacking_hero", [attack_power]);
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.value = self.health;
	$AttackTimer.value = 100 -  self.attackTimerStep;
	$ColorRect.visible = selected
	
	#print(100 - (self.attackTimer - self.attackTimerStep) * 100);
	#print(self.attackTimer/(self.attackTimer - self.attackTimerStep) * 100);
	if attackTimerStep > 0:
		attackTimerStep = attackTimerStep - delta
	else:
		print('ATTACK!!!!');
		emit_signal("attacking_hero");
		attackTimerStep = attackTimer
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
