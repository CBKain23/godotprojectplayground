class_name Game_Manager extends Node


@export var sound : SoundSystem
@export var points : Points



var soundSystem : Sound 

@onready var pause : PauseMenu = PauseMenu.new()
var isPlayerAlive : bool = true

var player_points : int = 0

#func getPlayerCharacter(player : Character):
	#playerChar = player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func player_death(body: Character):
	body.queue_free()
	isPlayerAlive = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
