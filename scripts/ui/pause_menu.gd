class_name PauseMenu extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func unPauseGame():
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#Unpause the game and remove the pause menu from the screen.
func _on_resume_button_pressed() -> void:
	unPauseGame()
	Menu.removeFromScreen(self)

#Change the scene to the Main Menu, Unpause the game, and remove the pause menu from the screen
func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_packed(Menu.mainMenu)
	unPauseGame()
	Menu.removeFromScreen(self)


func _on_resume_button_button_down() -> void:
	pass
