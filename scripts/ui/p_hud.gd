class_name Player_HUD extends CanvasLayer

##Reference to the Health Text label node
@onready var healthText : Label = %HealthText

##Reference to the Coin text label node
@onready var coinText : Label = %CoinText

##Reference to the Player character node
@export var player : Character

##Reference to the YouWin Label node
@onready var youWin : Label = %YouWinText

func turnOffHUD():
	
	if get_tree().paused == true:
		visible = false
	else:
		visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	youWin.visible = false
	

func changeWinTextVisibility():
	youWin.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	coinText.text = "Coin: " + str(player.game_manager.points.getPoints())
	healthText.text = "Health: " + str(player.get_node("%HealthComponent").getHealth())
