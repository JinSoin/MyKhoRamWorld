extends Control

func _ready():
	InputMap.add_action("ui_up", KEY_W)
	$VBoxContainer/StartButton.add_theme_constant_override("ui_up", KEY_W)
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://World/Scenes/World.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()


