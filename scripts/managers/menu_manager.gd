extends CanvasLayer

var tryAgainMenu : PackedScene = preload("uid://bveatehsyiei4")
var mainMenu : PackedScene = preload("uid://bbeabhcoulgha")
var pauseMenu : PackedScene = preload("uid://dl6bp7jhwompc")

enum MenuSelect {TryAgain, MainSelect, Pause}

var menu_dict : Dictionary[MenuSelect, PackedScene] = {MenuSelect.MainSelect: mainMenu, 
MenuSelect.TryAgain : tryAgainMenu,
MenuSelect.Pause : pauseMenu, }

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func addToScreen(menu : PackedScene, tree : SceneTree):
	tree.root.add_child(menu.instantiate())

func removeFromScreen(menu: Node):
	menu.queue_free()
