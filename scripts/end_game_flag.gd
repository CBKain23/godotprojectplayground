class_name End_Game extends Area2D

#The collision node that will be disabled when the player gets to the end level flag
@onready var collision : CollisionShape2D = %Collision



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func endLevel(player : Character):
	
	##Disable the collision node
	collision.disabled = true
	
	#Stop the music
	player.game_manager.sound.stopMusic()
	
	#Display the 'You Win' text onto the screen
	player.get_node("%P_HUD").changeWinTextVisibility()
	
	#Play the 'You Win' and 'Win Jingle' SFX
	player.game_manager.sound.playSFX(player.game_manager.sound.win)
	player.game_manager.sound.playSFX(player.game_manager.sound.winJingle)
	player.game_manager.sound.playSFX(player.game_manager.sound.youWin)
	
	#Delay the scene change
	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_packed(Level.tryAgainMenu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Character) -> void:
	
	#endLevel(body.game_manager)
	if collision.disabled == false:
		endLevel(body)


func _on_delay_timeout() -> void:
	pass
