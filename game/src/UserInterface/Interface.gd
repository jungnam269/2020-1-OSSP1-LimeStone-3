extends Control

signal immunity_changed(immunity)
signal enemmys_changed(count)

##아직 수정 중
#Player에 면역 수치(hp같이) 추가해주어야함
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player_immunedamage(hp): #get player hp from player's signal 
	get_node("TextureProgress").value = hp #progress bar is change
