class_name Player_Controller extends Node



var jumpCount : int = 0
var jumpLimit : int = 1

##The player character reference
@export var player : Character

##The acceleration float for the player character.
@export var accelerFloat = 50.0

##The max speed in float for the player character.
@export var maxSpeedFloat = 500.0

##The speed at which the player's speed slows down on the ground.
@export var groundslowFloat : float = 35.0

##The speed at which the player's speed slows down in the air.
@export var airslowFloat : float = 5.0

##The jump height of the player character
@export var jumpFloat : float = -1.0 * 500.0

##The double jump height of the player character
@export_range(0.0, 1.0) var doubleJumpPercent : float = 0.8
var doubleJumpFloat = jumpFloat * doubleJumpPercent

##The velocity.y point in which the player will sense their falling
##The point on velocity.y where the player character will change their
var falling_pointFloat = 575.0

##The boolean variable to check if the player character has double jumped
var hasDoubleJumped : bool = false

##Display the pause menu to the screen
func pauseGame():
	#Declare a variable for a boolean variable to check if the player has pressed the
	#pause command.
	var pauseGame := Input.is_action_pressed("pause")
	
	if pauseGame:
		get_tree().paused = true
		Menu.addToScreen(Menu.pauseMenu, get_tree())

##Reset the hasDoubleJumped boolean to false
func DoubleJumpReset():
	hasDoubleJumped = false

##Gives the player control over the movement of the player character
func player_movement():
	
	#Getting the float variable to represent the player's direction
	var direction := Input.get_axis("move_left","move_right")
	
	#Create a slow down speed variable so it can be assigned to either slow down variables
	var slowDownFloat : float
	
	#If the player is currently moving
	if direction == 1.0:
		
		player.velocity.x += direction * accelerFloat
		if player.velocity.x > maxSpeedFloat:
			player.velocity.x = maxSpeedFloat
	elif direction == -1.0:
		player.velocity.x -= -direction * accelerFloat
		
		if player.velocity.x < -maxSpeedFloat:
			player.velocity.x = -maxSpeedFloat
	else:
		
		if player.is_on_floor():
			slowDownFloat = groundslowFloat
		else:
			slowDownFloat = airslowFloat
		
		#Apply the slowDown variable to the player's velocity
		player.velocity.x = move_toward(player.velocity.x, 0, slowDownFloat)
	
	#animation.animation(direction, character.get_sprite(),character, self)
	#player.char_animation.animation(direction, player.get_node("%PlayerSprite"),self)
	
	#Play the player character's animations
	player.animation(direction)
	

##Gives the player character the ability to jump
func jump():
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = jumpFloat
		player.game_manager.sound.playSFX(player.game_manager.sound.jump)
		
		jumpCount += 1
	
	if Input.is_action_just_pressed("jump") and not hasDoubleJumped and not player.is_on_floor():
		player.velocity.y = doubleJumpFloat
		player.game_manager.sound.playSFX(player.game_manager.sound.jump2)
		hasDoubleJumped = true
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pauseGame()

func _physics_process(delta: float) -> void:
	
	jump()
	
	if player.is_on_floor():
		DoubleJumpReset()
		
		jumpCount = 0
	
	player_movement()
	
	player.move_and_slide()
	
