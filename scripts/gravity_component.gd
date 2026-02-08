class_name Gravity extends Node

@export var character : CharacterBody2D
@export var isGravityOn : bool = true
@export_range(0.0, 1.0) var mass : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func applyGravity(delta: float):
	if not character.is_on_floor():
		character.velocity += (character.get_gravity() * mass) * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if isGravityOn:
		applyGravity(delta)
