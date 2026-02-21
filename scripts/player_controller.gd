class_name Player_Controller extends Node



##The amount of times the player character has jumped
var jumpCount : int = 0

##How many times the player character can jump
var jumpLimit : int = 1

##The player character reference
@export var player : Character

##The multipler for the sprint float variable
@export_range(1.0, 2.0) var sprintMulti : float = 1.5

##The sprint speed for the player character
#var sprintSpeed : float = maxSpeedFloat * sprintMulti

##The acceleration float for the player character.
@export var accelerFloat : float = 50.0

@onready var sprintAcceler : float = accelerFloat * 1.4

##The max speed in float for the player character.
@export var maxSpeedFloat : float = 500.0

##The max sprint for the player character
@onready var maxSprintSpeed : float = maxSpeedFloat * sprintMulti

##The speed at which the player's speed slows down on the ground.
@export var groundSlowFloat : float = 35.0

##The speed at which the player's speed slows down in the air.
@export var airSlowFloat : float = 5.0

##The jump height of the player character
@export var jumpFloat : float = -1.0 * 500.0

##The double jump height of the player character
@export_range(0.0, 1.0) var doubleJumpPercent : float = 0.8
@onready var doubleJumpFloat = jumpFloat * doubleJumpPercent

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
		Menu.addToScreen(Menu.pauseMenu, get_tree())
	

##Reset the hasDoubleJumped boolean to false
func DoubleJumpReset():
	hasDoubleJumped = false

##Make the player character move faster
func sprint():
	pass

##Gives the player control over the movement of the player character
func player_movement():
	
	#Getting the float variable to represent the player's direction
	var direction := Input.get_axis("move_left","move_right")
	
	#Getting a boolean variable to represent the player inputting 'sprint'
	var sprinting := Input.is_action_pressed("sprint")
	
	#Create a slow down speed variable so it can be assigned to either slow down variables
	var slowDownFloat : float
	
	#Check to see if the player is inputting a directional button
	if direction == 1.0:
		
		#If the player inputted the sprint command
		if sprinting:
			player.velocity.x += direction * sprintAcceler
			
			if player.velocity.x > maxSprintSpeed:
				player.velocity.x = maxSprintSpeed
		else:
			#Add the direction times the Acceleration float variable to the
			#player's x velocity
			player.velocity.x += direction * accelerFloat
			#If the player's x velocity is greater than the MAX Speed float variable,
			#set the player's x velocity to the MAX Speed float variable
			if player.velocity.x > maxSpeedFloat:
				player.velocity.x = maxSpeedFloat
	
	#Similar to the code above, but for the opposite directional input
	elif direction == -1.0:
		
		if sprinting:
			player.velocity.x -= -direction * sprintAcceler
			
			if player.velocity.x < -maxSprintSpeed:
				player.velocity.x = -maxSprintSpeed
		else:
			
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
	
	#A reference variable to the player input for 'jump'
	var jumping = Input.is_action_just_pressed("jump")
	
	#Check to see if the player has inputted the jump command while the player character
	#is on the ground
	if jumping and player.is_on_floor():
		
		#Set the player's y velocity to the jumpFloat variable
		player.velocity.y = jumpFloat
		
		#Play the jump SFX from the game manager's sound variable
		player.game_manager.sound.playSFX(player.game_manager.sound.jump)
		
		#Increment the jumpCount integer value by 1
		jumpCount += 1
	
	#Check to see if the player has inputted the jump command again while the player character 
	#is in the air
	if jumping and not hasDoubleJumped and not player.is_on_floor():
		
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
	
