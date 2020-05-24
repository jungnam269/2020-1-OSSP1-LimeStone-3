extends HBoxContainer

func _on_Interface_immunity_changed(immunity):
	$TextureProgress.value = immunity
##아직 수정 중
