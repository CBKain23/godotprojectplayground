extends CanvasLayer

var menu : Menu

@onready var main : Control = %Main

@export var select : Menu.MenuSelect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#Add the main menu to the main control node to put on the screen.
	main.add_child(Menu.addToScreen(Menu.mainMenu, get_tree()))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
