class_name Points extends Node


var points : int = 0

func getPoints()-> int:
	return points

func setPoints(newPoints: int):
	points = newPoints

func addPoints(add : int):
	points += add

func subtractPoints(subtract: int):
	points -= subtract

func resetPoints():
	points = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
