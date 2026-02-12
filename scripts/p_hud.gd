class_name Player_HUD extends CanvasLayer

@onready var healthText : Label = %HealthText
@onready var coinText : Label = %CoinText
@export var player : Character
@onready var youWin : Label = %YouWinText


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	youWin.visible = false
	

func changeWinTextVisibility():
	youWin.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	coinText.text = "Coin: " + str(player.game_manager.points.getPoints())
	healthText.text = "Health: " + str(player.get_node("%HealthComponent").getHealth())
