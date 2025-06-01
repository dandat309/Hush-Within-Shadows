extends Node

var sons_efeitos: AudioStreamPlayer
var sons_ambiente: AudioStreamPlayer

func _ready():
	# Som ambiente
	sons_ambiente = AudioStreamPlayer.new()
	sons_ambiente.stream = preload("res://howling-wind-109590.mp3")
	sons_ambiente.volume_db = -10
	add_child(sons_ambiente)
	sons_ambiente.play()

# Função pra parar a música
func parar_ambiente():
	sons_ambiente.stop()

func tocar_ambiente():
	sons_ambiente.play()
