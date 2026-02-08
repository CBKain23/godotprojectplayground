class_name Health extends Node


@export var max_health : int = 100
@onready var current_health : int = max_health


signal health_depleted
signal health_changed(old_value : int, new_value : int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func getHealth() -> int:
	return current_health

func setHealth(health : int):
	#health_changed.emit(current_health, health)
	current_health = health
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_health_changed(old_value: int, new_value: int) -> void:
	pass
