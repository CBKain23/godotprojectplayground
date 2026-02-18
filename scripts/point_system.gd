class_name Points extends Node


#The integer variable to represents points
var points : int = 0

##Return the points
func getPoints()-> int:
	return points

##Set points to a new integer value
func setPoints(newPoints: int):
	points = newPoints

##Incremental add points
func addPoints(add : int):
	points += add

##Decremental subtract points
func subtractPoints(subtract: int):
	points -= subtract

##Reset the points to 0
func resetPoints():
	points = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
