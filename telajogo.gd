extends Control

func _ready():
	Sons.sons_ambiente.stop()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://tela_saves.tscn")
