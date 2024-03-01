extends Node2D

@onready var main := get_tree().root.get_node('Main')
const Player = preload("res://player/player.tscn")
const Enemy = preload("res://enemies/enemy.tscn")
@onready var audio = get_node("AudioStreamPlayer")

# Vars
var started = false
var timer_score = Timer.new()
@export var score = 0
var scoreText = Label.new()
var timer = Timer.new()
var gameover_scene

func _ready():
	audio.play()
	started = true
	scoreText.z_index = 30
	add_child(scoreText)
	add_child(Player.instantiate())
	add_child(timer_score)
	add_child(timer)
	timer_score.wait_time = 1
	timer_score.start()
	timer_score.connect('timeout', _timeout_score)
	timer.autostart = true
	timer.connect('timeout', _timeout)

func _process(delta):
	if started:
		Score()
		if timer.is_stopped():
			if score >= 0:
				add_child(newEnemyLeft())
				initTimer(1.5)
			if score >= 5:
				add_child(newEnemyRight())
				initTimer(1)
			if score >= 10:
				add_child(newEnemyTop())
				initTimer(0.75)
			if score >= 15:
				add_child(newEnemyBottom())
				initTimer(0.5)
			
func Score():
	scoreText.position = Vector2((main.vp().size.x / 100) * 2, (main.vp().size.y / 100) * 2)
	scoreText.text = "Score: " + str(score)
	scoreText.scale = Vector2(1.8 * (main.vp().size.y / 1000), 1.8 * (main.vp().size.y / 1000))
	
func newEnemyLeft():
	var e = Enemy.instantiate()
	e.color = 'red'
	e.speed = 300 * (score * 0.05 * (main.vp().size.x / 1000))
	e.position = Vector2(-e.scale.x, randi_range(10, main.vp().size.y - 10))
	e.direction = Vector2(1, 0)
	return e
	
func newEnemyRight():
	var e = Enemy.instantiate()
	e.color = 'green'
	e.position = Vector2(e.scale.x + main.vp().size.x, randi_range(10, main.vp().size.y - 10))
	e.speed = 400 * (score * 0.05 * (main.vp().size.x / 1000))
	e.direction = Vector2(-1, 0)
	return e
	
func newEnemyTop():
	var e = Enemy.instantiate()
	e.color = 'yellow'
	e.position = Vector2(randi_range(10, main.vp().size.x - 10), -e.scale.y)
	e.speed = 500 * (score * 0.05 * (main.vp().size.x / 1000))
	e.direction = Vector2(0, 1)
	return e
	
func newEnemyBottom():
	var e = Enemy.instantiate()
	e.color = 'gray'
	e.position = Vector2(randi_range(10, main.vp().size.x - 10), e.scale.y + main.vp().size.y)
	e.speed = 600 * (score * 0.05 * (main.vp().size.x / 1000))
	e.direction = Vector2(0, -1)
	return e
	
func initTimer(time: float):
	timer.wait_time = time
	timer.start()
	
func _timeout():
	timer.stop()
	pass
	
func _timeout_score():
	score += 1
	timer_score.wait_time = 1
	timer_score.start()
