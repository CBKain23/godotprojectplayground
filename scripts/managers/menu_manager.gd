extends CanvasLayer

##The PackedScene for the Try Again Menu
var tryAgainMenu : PackedScene = preload("uid://bveatehsyiei4")

##The PackedScene for the Main Menu
var mainMenu : PackedScene = preload("uid://bbeabhcoulgha")

##The PackedScene for the PauseMenu
var pauseMenu : PackedScene = preload("uid://dl6bp7jhwompc")

##The enumeration for the Menu Select
enum MenuSelect {TryAgain, MainSelect, Pause}

##The dictionary for Menus
var menu_dict : Dictionary[MenuSelect, PackedScene] = {MenuSelect.MainSelect: mainMenu, 
MenuSelect.TryAgain : tryAgainMenu,
MenuSelect.Pause : pauseMenu, }

var isPauseMenuUp = false
var pauseMenuHolder : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##Add the menu to the screen
func addToScreen(menu : PackedScene, tree : SceneTree):
	tree.root.add_child(menu.instantiate())

##Remove the menu from the screen
func removeFromScreen(menu: Node):
	menu.queue_free()

##Add the pause menu from the player's screen
func addPauseScreen(tree : SceneTree):
	
	#Assigning the pause menu to a menu holder, so that I can be removed with the remove function
	pauseMenuHolder = pauseMenu.instantiate()
	
	#Adding the pause menu node to the Scene Tree
	tree.root.add_child(pauseMenuHolder)

##Remove the pause menu from the player's screen
func removePauseScreen():
	
	#Checks to see if the Pause Menu Holder isn't null
	if pauseMenuHolder == null:
		
		#Remove the pause menu from the player's screen
		pauseMenuHolder.queue_free()
