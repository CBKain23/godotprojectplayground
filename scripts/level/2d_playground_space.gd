extends Node2D

@export var manager : Game_Manager

@onready var main : Control = %Main
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	#GameManager.sound.playMusic(GameManager.sound.BasicLevel)
	
	#Play the music for the basic level
	manager.sound.playMusic(manager.sound.BasicLevel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
