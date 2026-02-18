class_name Game_Manager extends Node


##The referenece variable from the Sound class
@export var sound : Sound

##The reference variable from the Points class
var points : Points = preload("uid://ddyxt1rwmgkuk").instantiate()

##The boolean variable to check to see if the player character is alive or not
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
