class_name Character extends CharacterBody2D

#The export variables for charater animation, game manager, and player controller
@export var char_animation : Character_Animation
@export var game_manager : GameManager
@export var player_controller : Player_Controller

var gameManager : GameManager

func _ready() -> void:
	pass

##The animation for the player character
func animation(direction: float):
	
	#Section that controls the flip_h property of the sprite of the player character
	if direction == 1:
		
		%PlayerSprite.flip_h = false
	elif direction == -1:
		
		%PlayerSprite.flip_h = true
	
	#Section that controls the animations for walking and idling whenever the player character
	#is on the ground.
	if velocity.x > (player_controller.maxSpeedFloat * 0.01) or velocity.x < (-player_controller.maxSpeedFloat * 0.01):
		if is_on_floor():
			%PlayerSprite.play("Walk")
	else:
		%PlayerSprite.play("Idle")
	
	#Section that controls the animation for when the player character is falling
	if velocity.y > player_controller.falling_pointFloat and not is_on_floor():
		%PlayerSprite.play("Fall") 
	
	#Section that controls the animation for the player character when they jump
	if velocity.y < -10 and not is_on_floor():
		%PlayerSprite.play("Jump")

func _physics_process(delta: float) -> void:
	pass
