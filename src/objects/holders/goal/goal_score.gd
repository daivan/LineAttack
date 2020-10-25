extends Node

# Goal information
export (int) var score_needed
var score_collected = 0
var goal_met = false
var goal_type = "score"

func check_goal(goal_type):
	return goal_met
	
func update_score(current_score):
	score_collected = current_score;
	if score_collected > score_needed:
		goal_met = true
