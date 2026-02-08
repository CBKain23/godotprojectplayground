extends Control

var health : int = 10

@onready var healthText = %HealthText
@onready var coinText = %CoinText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#%YouWinText.visible = false
	healthText.text = "Health: " + str(health)
	coinText.text = "Coin: " + str(50)

func playerWins():
	%YouWinText.visible = true
	%WinSFX.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
