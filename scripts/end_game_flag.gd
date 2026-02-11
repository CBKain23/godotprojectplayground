class_name End_Game extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func endLevel(player : Character):
	player.game_manager.sound.stopMusic()
	player.get_node("%P_HUD").changeWinTextVisibility()
	player.game_manager.sound.playSFX(player.game_manager.sound.win)
	await get_tree().create_timer(5.0).timeout
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Character) -> void:
	
	#endLevel(body.game_manager)
	endLevel(body)


func _on_delay_timeout() -> void:
	pass
