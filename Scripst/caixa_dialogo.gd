extends Control

@export var falas : Array = [
	"Você ouviu de novo... não ouviu?",
	"Ela sussurra seu nome, mesmo quando você finge dormir.",
	"Você trancou a porta, mas não trancou a lembrança.",
	"A casa está vazia. Mas algo... respira.",
	"Você disse que não era real.",
	"Então por que ela ainda sangra nos seus sonhos?",
	"Ele se mexe, Fred. Lá dentro... no escuro.",
	"E dessa vez... ele quer que você veja."
]

var indice = 0
var texto_completo = ""
var texto_atual = ""
var velocidade = 0.04
var digitando = false
var id_digitar = 0  # ID pra controlar qual digitação é a atual

func _ready():
	iniciar_texto()

func iniciar_texto() -> void:
	texto_completo = falas[indice]
	texto_atual = ""
	digitando = true
	$Texto.text = ""
	id_digitar += 1
	await start_digitar(id_digitar)

func start_digitar(minha_id: int) -> void:
	for i in range(texto_completo.length()):
		if minha_id != id_digitar:
			return  # Cancela se uma nova digitação começou
		await get_tree().create_timer(velocidade).timeout
		texto_atual += texto_completo[i]
		$Texto.text = texto_atual
	digitando = false

func _input(event):
	if event.is_pressed():
		if digitando:
			id_digitar += 1  
			$Texto.text = texto_completo
			digitando = false
		else:
			indice += 1
			if indice >= falas.size():
				get_tree().change_scene_to_file("res://Cenas/Porao.tscn")
			else:
				iniciar_texto()
