extends Camera3D

func _process(delta):
	var characterAkai = load("res://Charater/Akai.gd")
	var target_position = $Akai.position
	look_at(target_position, Vector3(0,1,0))
