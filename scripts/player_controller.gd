class_name Player_Controller extends Node

const ACCELERATION = 50.0
const MAX_SPEED = 500.0
const GROUND_SLOW_DOWN_SPEED = 35.0
const AIR_SLOW_DOWN_SPEED = 5.0
const JUMP_VELOCITY = -1 * 500.0
const DOUBLE_JUMP_VELOCITY = JUMP_VELOCITY * 0.8
const FALLING_POINT = 575.0

var jumpCount : int = 0
var jumpLimit : int = 1

@export var player : Character

##The acceleration float for the player character
@export var accelerFloat = 50.0


##The max speed in float for the player character
@export var maxSpeedFloat = 500.0

##
@export var groundslowFloat : float = 35.0

@export var airslowFloat : float = 5.0

@export var jumpFloat : float = -1.0 * 500.0

@export_range(0.0, 1.0) var doubleJumpPercent : float = 0.8
var doubleJumpFloat = jumpFloat * doubleJumpPercent

##The point on velocity.y where the player character will change their
var falling_pointFloat = 575.0

var hasDoubleJumped : bool = false

func pauseGame():
	var pauseGame := Input.is_action_pressed("pause")
	
	if pauseGame:
		get_tree().paused = true
		Menu.addToScreen(Menu.pauseMenu, get_tree())

#@onready var animation = Character_Animation.new()
func DoubleJumpReset():
	hasDoubleJumped = false

##Gives the player control over the movement of the player character
func player_movement():
	
	var direction := Input.get_axis("move_left","move_right")
	var slowDownFloat : float
	
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
		
		player.velocity.x = move_toward(player.velocity.x, 0, slowDownFloat)
	
	#animation.animation(direction, character.get_sprite(),character, self)
	#player.char_animation.animation(direction, player.get_node("%PlayerSprite"),self)
	player.animation(direction)
	

##Gives the player character the ability to jump
func jump():
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = jumpFloat
		player.game_manager.sound.playSFX(player.game_manager.sound.jump)
		#player.gameManager.sound.playSFX(player.gameManager.sound.jump)
		#player.gameManager.soundSystem.playSFX(player.gameManager.sound.jump)
		
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
	
