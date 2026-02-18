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
