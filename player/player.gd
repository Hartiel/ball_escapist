extends Node2D

var scaleInit = Vector2(scale)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _physics_process(_delta):
	# move mouse
	var vp = get_viewport_rect()
	var xpercente = ((vp.size.x + vp.size.y) / 2) / 100
	
	scale.x = scaleInit.x * (xpercente * .3)
	scale.y = scaleInit.y * (xpercente * .3)
	
	var mouse_pos = get_global_mouse_position()
	
	#lock mouse
	if mouse_pos.x < 0:
		mouse_pos.x = 0
	if mouse_pos.x > vp.size.x:
		mouse_pos.x = vp.size.x
	if mouse_pos.y < 0:
		mouse_pos.y = 0
	if mouse_pos.y > vp.size.y:
		mouse_pos.y = vp.size.y
	
	#movement
	if mouse_pos.x >= 0 and mouse_pos.x <= vp.size.x:
		position.x = mouse_pos.x
	if mouse_pos.y >= 0 and mouse_pos.y <= vp.size.y:
		position.y = mouse_pos.y
	
	pass
