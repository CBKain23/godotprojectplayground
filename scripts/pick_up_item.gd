class_name PickUp extends Area2D

var coinVal : int = 1

enum PickUpType {Coin}
@export var pickUp  : PickUpType

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func pickUpItem(item : PickUpType):
	
	match item:
		PickUpType.Coin:
			GameManager.points.addPoints(coinVal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	
	if area.get_collision_layer_value(7) == true:
		pickUpItem(pickUp)
		get_parent().queue_free()
