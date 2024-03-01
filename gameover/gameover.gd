extends Node2D

@onready var main := get_tree().root.get_node('Main')
@onready var btnTenteNovamente = get_node("BtnTenteNovamente")
@onready var btnQuit = get_node("BtnQuit")

func _ready():
	# Modes
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	
	# Buttons
	btnTenteNovamente.position = Vector2(
		get_viewport_rect().size.x / 2 - btnTenteNovamente.size.x / 2,
		get_viewport_rect().size.y / 2 - btnTenteNovamente.size.y / 2
	)
	
	btnQuit.position = Vector2(
		get_viewport_rect().size.x / 2 - btnQuit.size.x / 2,
		get_viewport_rect().size.y / 2 - btnQuit.size.y / 2 + 50
	)
	
	# Pause
	get_tree().paused = true

func _on_btn_tente_novamente_pressed():
	main.resetGame()
	get_tree().paused = false
	self.queue_free()

func _on_btn_quit_pressed():
	get_tree().paused = false
	get_tree().quit()
