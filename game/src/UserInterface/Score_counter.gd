extends NinePatchRect

func _on_Interface_enemmys_changed(count): #귀가시킨 적의 수를 count해서 점수로 환산 
	$Score.text = str(count*19000)+" 점"
	
#적이 귀가하는 것과 연동 필요
