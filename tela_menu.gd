extends Control

func _input(event):
	if event.is_pressed():
		get_tree().change_scene_to_file("res://tela_saves.tscn")
