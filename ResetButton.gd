extends TextureButton
var reset_state = false
onready var timer = get_node("Timer")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func ResetPressed():
	if reset_state == false:
		reset_state = true

		get_node("Label").text = "Reset?"
		
		timer.set_wait_time(1)
		timer.start()
	
	elif reset_state == true:
		get_parent().DisplayValue =0
		timer.stop()
		get_node("Label").text = "Reset"
	
func TimerTimeout():
	timer.stop()
	reset_state = false
	get_node("Label").text = "Reset"
