extends Node2D

@export var manager : Game_Manager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	manager.sound.playMusic(manager.sound.BasicLevel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
