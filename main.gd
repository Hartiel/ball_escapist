extends Node2D

# Scenes
const Menu = preload("res://menu/menu.tscn")
const Game = preload("res://game/game.tscn")
const Gameover = preload("res://gameover/gameover.tscn")
@export var newGame = Game.instantiate()

func _ready():
	newMenu()
	
func vp():
	return get_viewport_rect()

func newMenu():
	add_child(Menu.instantiate())

func startGame():
	newGame = Game.instantiate()
	add_child(newGame)
	
func newGameOver():
	add_child(Gameover.instantiate())
	
func resetGame():
	newGame.queue_free()
	startGame()

func _on_gameover():
	add_child(Gameover.instantiate())
