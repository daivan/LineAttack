extends Node

signal create_fail
signal game_lost

func _ready():
	create_fails();
	
func create_fails():
	for i in get_child_count():
		var current = get_child(i)
		if(current.fail_type == "timer"):
			emit_signal("create_fail", current.time_needed)


func check_game_fail():
	if fails_met():
		print('YOU LOST LOOSER')
		emit_signal("game_lost");

func fails_met():
	for i in get_child_count():
		if get_child(i).fail_met == false:
			return false;
	return true;
	

func _on_second_timer_timeout():

	for i in get_child_count():
		var current = get_child(i)
		if(current.fail_type == "timer"):
			current.update_timer()
	check_game_fail()
