extends RichTextLabel

var s = 30

func _process(delta):
	
	if s == 0 :
		get_tree().change_scene("res://src/Sceens/EndingScreen.tscn")

	else :
		set_text(str(s))
		
		pass


func _on_Timer_timeout():
	
	s -= 1
	
	pass
