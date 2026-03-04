class_name PauseMenu extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true

func unPauseGame():
	get_tree().paused = false

func unPausePlayerCommand():
	
	#Get the boolean variable when the player pressed the pause button
	var unpause = Input.is_action_just_pressed("pause")
	
	#If the player press the pause button, remove the pause menu
	if unpause and get_tree().paused:
		unPauseGame()
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	unPausePlayerCommand()


#Unpause the game and remove the pause menu from the screen.
func _on_resume_button_pressed() -> void:
	
	#Call the Unpaused menu function 
	unPauseGame()
	
	#Call the simple queue free function to remove the menu
	queue_free()

#Change the scene to the Main Menu, Unpause the game, and remove the pause menu from the screen
func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_packed(Menu.mainMenu)
	unPauseGame()
	Menu.removeFromScreen(self)


func _on_resume_button_button_down() -> void:
	pass
