extends Node2D

onready var brickSprite : Sprite = $Sprite
onready var timer : Timer = $Timer
onready var particles : CPUParticles2D = $CPUParticles2D
var counter : int = 0
var particleOn : bool = false
var colors = {
	"blue": 0,
	"green": 1,
	"red": 2,
	"yellow": 3
}

# Called when the node enters the scene tree for the first time.
func _ready():
	particles.emitting=false
	particles.visible=false
	

#func setBrickColor(color : String) -> int:
#	return colors[color]

func setBrickColor(color : String) -> void:
	brickSprite.frame = colors[color]
	particles.anim_offset=brickSprite.frame/4.0 #offset is 0-1
	
func destroyBrick() -> void:
	timer.start()
	

func _on_Timer_timeout():
	counter += 1
	particles.emitting = true
	if counter == 2:
		particles.visible=true
		brickSprite.set_visible(false)
	if counter == 20:
		particles.visible=false
		get_parent().queue_free()
