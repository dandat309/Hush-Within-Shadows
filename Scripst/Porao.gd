extends Control

@export var portafechada: Texture
@export var portaaberta: Texture

@onready var TabuleroOuija = $TabuleroOuija
@onready var som_TabuleroOuija = $TabuleroOuija/Creepy
@onready var armario = $armario
@onready var som_armario = $armario/TentandoAbrirPorta
@onready var interruptor = $interruptor
@onready var som_interruptor = $interruptor/Interruptor
@onready var fundo_caixa = $caixaDedialogo
@onready var nome_label = $caixaDedialogo/Nome/plaNAme
@onready var texto = $caixaDedialogo/Nome/plaNAme/Texto
@onready var bilhete = $Bilhete
@onready var chave = $Chave
@onready var porta = $Porta
@onready var som_porta = $Porta/Doorcreakinh

var bilhete_ativo = false
var clicou_ouija = false
var clicou_bilhete = false
var clicou_armario = false
var clicou_interruptor = false

func _ready():
	fundo_caixa.visible = false
	chave.visible = false
	Sons.sons_ambiente.stop()


func mostrar_mensagem(nome: String, fala: String) -> void:
	nome_label.text = nome
	texto.text = fala
	fundo_caixa.visible = true

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if fundo_caixa.visible:
			fundo_caixa.visible = false
		elif bilhete_ativo:
			bilhete.visible = false
			bilhete_ativo = false

func _on_tabulero_ouija_pressed() -> void:
	clicou_ouija = true
	som_TabuleroOuija.play()
	mostrar_mensagem("HUSH", "Você abriu o caminho. Agora ele sussurra por você...")
	verificar_tudo_clicado()

func _on_armario_pressed() -> void:
	clicou_armario = true
	som_armario.play()
	mostrar_mensagem("Você", "Aparenta não ter chave")
	verificar_tudo_clicado()

func _on_interruptor_pressed() -> void:
	clicou_interruptor = true
	som_interruptor.play()
	mostrar_mensagem("HUSH", "Você quer ver hahaha, eles também queriam")
	verificar_tudo_clicado()

func _on_bilhete_pressed() -> void:
	clicou_bilhete = true
	var final_pos = Vector2(get_viewport_rect().size.x / 4, get_viewport_rect().size.y / 4)
	var final_scale = Vector2(20, 20)
	var local_tween = create_tween()
	local_tween.tween_property(bilhete, "position", final_pos, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	local_tween.tween_property(bilhete, "scale", final_scale, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	local_tween.finished.connect(_on_bilhete_tween_finished)
	verificar_tudo_clicado()

func _on_bilhete_tween_finished() -> void:
	bilhete_ativo = true

func verificar_tudo_clicado():
	if clicou_ouija and clicou_bilhete and clicou_armario and clicou_interruptor:
		chave.visible = true

func _on_chave_pressed() -> void:
	chave.visible = false
	abrir_porta()

func abrir_porta() -> void:
	porta.texture_pressed = portaaberta
	som_porta.play()
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Cenas/ProximaCena.tscn")
