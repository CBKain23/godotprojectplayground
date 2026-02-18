class_name Game_Manager extends Node


#The sound reference
@export var sound : Sound
var points : Points = preload("uid://ddyxt1rwmgkuk").instantiate()

var isPlayerAlive : bool = true


#func getPlayerCharacter(player : Character):
	#playerChar = player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

##The function for the death of the player
func player_death(body: Character):
	body.queue_free()
	isPlayerAlive = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
