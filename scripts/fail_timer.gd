extends Node


export (int) var time_needed
var time_passed = 0
var fail_met = false
var fail_type = "timer"


func check_fail(fail_type):
	return fail_met
	
func update_timer():
	time_passed += 1;
	if time_passed > time_needed:
		fail_met = true
