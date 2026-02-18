class_name Gravity extends Node

#Get the character reference
@export var character : CharacterBody2D

##The boolean variable for the character's gravity to be able to turn it off and on.
@export var isGravityOn : bool = true

#To represent the mass of the character
@export_range(0.0, 1.5) var mass : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


##Apply the gravity to the character
func applyGravity(delta: float):
	if not character.is_on_floor():
		character.velocity += (character.get_gravity() * mass) * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if isGravityOn:
		applyGravity(delta)
