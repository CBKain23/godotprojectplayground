class_name Player_Controller extends Node



##The amount of times the player character has jumped
var jumpCount : int = 0

##How many times the player character can jump
var jumpLimit : int = 1

##The player character reference
@export var player : Character

##The acceleration float for the player character.
@export var accelerFloat = 50.0

##The max speed in float for the player character.
@export var maxSpeedFloat = 500.0

##The speed at which the player's speed slows down on the ground.
@export var groundSlowFloat : float = 35.0

##The speed at which the player's speed slows down in the air.
@export var airSlowFloat : float = 5.0

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
	
	#Check to see if the player is inputting a directional button
	if direction == 1.0:
		
		#Add the direction times the Acceleration float variable to the
		#player's x velocity
		player.velocity.x += direction * accelerFloat
		
		#If the player's x velocity is greater than the MAX Speed float variable
		#set the player's x velocity to the MAX Speed variable
		if player.velocity.x > maxSpeedFloat:
			player.velocity.x = maxSpeedFloat
	
	#Similar to the code above, but for the opposite directional input
	elif direction == -1.0:
		player.velocity.x -= -direction * accelerFloat
		
		if player.velocity.x < -maxSpeedFloat:
			player.velocity.x = -maxSpeedFloat
	
	#If the player isn't pressing any directional buttons, slow down the player's
	#speed.
	else:
		
		#Check to see if the player is on the floor, if so, then set slowDownFloat
		#variable to groundSlowFloat
		if player.is_on_floor():
			slowDownFloat = groundSlowFloat
		
		#If in the air, set the slowDownFloat to airSlowFlat
		else:
			slowDownFloat = airSlowFloat
		
		#Apply the slowDown variable to the player's velocity
		player.velocity.x = move_toward(player.velocity.x, 0, slowDownFloat)
	
	#animation.animation(direction, character.get_sprite(),character, self)
	#player.char_animation.animation(direction, player.get_node("%PlayerSprite"),self)
	
	#Play the player character's animations
	player.animation(direction)
	

##Gives the player character the ability to jump
func jump():
	
	#Check to see if the player has inputted the jump command while the player character
	#is on the ground
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		
		#Set the player's y velocity to the jumpFloat variable
		player.velocity.y = jumpFloat
		
		#Play the jump SFX from the game manager's sound variable
		player.game_manager.sound.playSFX(player.game_manager.sound.jump)
		
		#Increment the jumpCount integer value by 1
		jumpCount += 1
	
	#Check to see if the player has inputted the jump command again while the player character 
	#is in the air
	if Input.is_action_just_pressed("jump") and not hasDoubleJumped and not player.is_on_floor():
		
		#Set the player's y velocity to doubleJumpFloat
		player.velocity.y = doubleJumpFloat
		
		#Play the second jump SFX from the game manager's sound variable
		player.game_manager.sound.playSFX(player.game_manager.sound.jump2)
		
		#set the Has Double Jumped boolean variable to true
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
	
