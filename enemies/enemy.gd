extends Area2D

@onready var main := get_tree().root.get_node('Main')
@export var speed = 300.0
@export var direction = Vector2(1, 0)
@export var color: String
var enemyRed = load("res://enemies/enemyRed.png")
var enemyGreen = load("res://enemies/enemyGreen.png")
var enemyYellow = load("res://enemies/enemyYellow.png")
var enemyGray = load("res://enemies/enemyGray.png")
var scaleInit = Vector2(scale)

func _ready():
	self.add_to_group('enemy')
	add_child(sprite())

func _process(delta):
	var vp = get_viewport_rect()
	var xpercente = ((vp.size.x + vp.size.y) / 2) / 100
	
	if (speed <= 300):
		speed = 300
	
	scale.x = scaleInit.x * (xpercente * .3)
	scale.y = scaleInit.y * (xpercente * .3)
	
	if position.x > vp.size.x + (scale.x * 2):
		queue_free()
	if position.x < 0 - (scale.x * 2):
		queue_free()
	if position.y > vp.size.y + (scale.y * 2):
		queue_free()
	if position.y < 0 - (scale.y * 2):
		queue_free()

	self.position += direction * speed * delta

func sprite():
	var s = Sprite2D.new()
	match color:
		'red':
			s.texture = enemyRed
		'green':
			s.texture = enemyGreen
		'yellow':
			s.texture = enemyYellow
		'gray':
			s.texture = enemyGray
	return s

func _on_body_entered(body):
	if (body.is_in_group("Player")):
		main._on_gameover()
	pass # Replace with function body.e with function body.
