extends Control

func _ready():
	Sons.sons_ambiente.stop()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/telaInicio.tscn")


func _on_texture_button_pressed():
	print("Botão pressionado")


func _on_texture_button_2_pressed():
	print("Botão pressionado")
