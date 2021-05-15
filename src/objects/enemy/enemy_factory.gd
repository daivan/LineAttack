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

var attackTurn = 5;
var currentAttackTurn = 5;

var parent = Node;

# Called when the node enters the scene tree for the first time.
func _ready():
	battle_event_bus.connect("move_block", self, "_on_move_block");
	
	# Create a cross node signal to hero_spawner
	#var hero_spawner = get_tree().get_root().get_node("hero_spawner");
	#connect("attacking_hero", hero_spawner, "_on_enemy_attacking_hero", [attack_power]);
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$ProgressBar.value = self.health;
	$AttackTimer.value = self.currentAttackTurn*20
	#$ColorRect.visible = selected
	
	#print(100 - (self.attackTimer - self.attackTimerStep) * 100);
	
	#print(self.attackTurn/(self.attackTurn - self.currentAttackTurn) * 100);
	#if attackTimerStep > 0:
	#	attackTimerStep = attackTimerStep - delta
	#else:
	#	print('ATTACK!!!!');
	#	emit_signal("attacking_hero");
	#	attackTimerStep = attackTimer
	pass
	
func _on_move_block():
	self.currentAttackTurn = self.currentAttackTurn - 1;
	
	if self.currentAttackTurn == 0:
		attack();
		self.currentAttackTurn = self.attackTurn
		

func attack():
	print('attacking!!!!');
	battle_event_bus.emit_signal("enemy_attack")
	
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
	pass

func _on_TextureButton_pressed():
	print('touching');

	selected = true;
	pass # Replace with function body.

func connectSignal(parent):
	# Create a cross node signal
	print(battle_event_bus.what);
	battle_event_bus.connect("enemy_damage", self, "_on_take_damage");
	pass
