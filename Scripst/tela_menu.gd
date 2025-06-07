extends Control

@onready var fade = $FadeRect
@onready var anim = $AnimationPlayer
@onready var som_clique = $SonsClique

func _on_botao_jogar_pressed() -> void:
	som_clique.play()
	anim.play("fade_out")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Cenas/Introducao.tscn")


func _on_botao_som_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Introducao.tscn")
	

func _on_botao_sair_pressed() -> void:
		get_tree().change_scene_to_file("res://Cenas/Introducao.tscn")
