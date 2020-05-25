extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_on_pressed")
	pass
	
func _on_pressed():
	get_tree().set_pause(true)
	pass 
