extends RichTextLabel

var s = 100

func _process(delta):
	
	set_text(str(s))
	
	pass


func _on_Timer_timeout():
	s -= 1
	
	pass
