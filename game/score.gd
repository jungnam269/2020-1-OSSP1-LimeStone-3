extends Node2D


var score = 0
var stage = 1


func updatescore(localscore):
	score = localscore

func getscore():
	return score
	
func updatestage():
	stage += 1
	
func getstageno():
	return stage
	
func resetstage():
	stage = 0
