extends Node2D

@onready var main := get_tree().root.get_node('Main')
@onready var label_title = self.get_node('LabelTitle')
@onready var btn_start = self.get_node('BtnStart')
@onready var btn_quit = self.get_node('BtnQuit')

func _ready():
	#Stylish Label
	label_title.position = Vector2(get_viewport_rect().size.x / 2 - (label_title.size.x / 2), get_viewport_rect().size.y / 2 - 20 - 225)
	
	# Stylish Buttons
	self.styleBtn(
		btn_start,
		Vector2(get_viewport_rect().size.x / 2 - 100, get_viewport_rect().size.y / 2 - 20 - 25)
	)
	self.styleBtn(
		btn_quit,
		Vector2(get_viewport_rect().size.x / 2 - 100, get_viewport_rect().size.y / 2 - 20 + 25)
	)

func styleBtn(
	btn: Button,
	pos: Vector2 = Vector2(0, 0),
	size: Vector2 = Vector2(200, 40),
):
	btn.size = size
	btn.position = pos
	
func _on_btn_start_pressed():
	main.startGame()
	self.queue_free()

func _on_btn_quit_pressed():
	pass
