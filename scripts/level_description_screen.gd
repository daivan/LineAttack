extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_level

var level_description_text = 'hejsan';
# Called when the node enters the scene tree for the first time.
func _ready():
	var goal_score = get_node_or_null('../goal_holder/goal_score');
	var fail_timer = get_node_or_null('../fail_holder/fail_timer');
	
	if goal_score.score_needed > 0:
		level_description_text = 'Goal:\n'+ str(goal_score.score_needed) + ' Points';

	if fail_timer.time_needed > 0:
		level_description_text += '\nFail:\nTimer: '+ str(fail_timer.time_needed);
		
				
	$Label.text = level_description_text


func _on_TextureButton_pressed():
	get_node('../second_timer').start();
	
	$AnimationPlayer.play("slide_out");
	emit_signal("start_level");
	pass # Replace with function body.
