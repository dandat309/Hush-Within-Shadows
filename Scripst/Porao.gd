extends Control
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

var bilhete_ativo = false

func mostrar_mensagem(nome: String, fala: String) -> void:
	nome_label.text = nome
	texto.text = fala
	fundo_caixa.visible = true

func _on_tabulero_ouija_pressed() -> void:
	mostrar_mensagem("HUSH", "Você abriu o caminho. Agora ele sussurra por você...")
	som_TabuleroOuija.play()

func _ready():
	fundo_caixa.visible = false
	Sons.sons_ambiente.stop()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if fundo_caixa.visible:
			fundo_caixa.visible = false
		elif bilhete_ativo:
			bilhete.visible = false
			bilhete_ativo = false

func _on_bilhete_pressed() -> void:
	var final_pos = Vector2(get_viewport_rect().size.x / 4, get_viewport_rect().size.y / 4)
	var final_scale = Vector2(20, 20)
	var local_tween = create_tween()
	local_tween.tween_property(bilhete, "position", final_pos, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	local_tween.tween_property(bilhete, "scale", final_scale, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	local_tween.finished.connect(_on_bilhete_tween_finished)

func _on_bilhete_tween_finished() -> void:
	bilhete_ativo = true

func _on_armario_pressed() -> void:
	som_armario.play()
	mostrar_mensagem("Você", "Aparenta não ter chave")

func _on_interruptor_pressed() -> void:
	som_interruptor.play()
	mostrar_mensagem("HUSH", "Você quer ver hahaha, eles também queriam")
