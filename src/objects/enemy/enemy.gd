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

var parent = Node;
var attackTurn = 5;
var currentAttackTurn = 5;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Create a cross node signal to hero_spawner
	#var hero_spawner = get_tree().get_root().get_node("hero_spawner");
	#connect("attacking_hero", hero_spawner, "_on_enemy_attacking_hero", [attack_power]);
	
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
	battle_event_bus.emit_signal("found_match_what", 30);

	selected = true;
	pass # Replace with function body.

func connectSignal(parent):
	# Create a cross node signal
	print(battle_event_bus.what);
	#battle_event_bus.connect("enemy_damage", self, "_on_take_damage");
	connect("selecting_enemy", parent, "_on_enemy_selecting_enemy");
	pass
