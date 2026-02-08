class_name SoundSystem extends Node

var isMusicPlaying : bool = false

var music_set = {AudioStreamPlayer: MainMenuMusic}

@export var game_manager : Game_Manager

@export var coin : AudioStreamPlayer
@export var win : AudioStreamPlayer
@export var jump : AudioStreamPlayer
@export var MainMenuMusic : AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	

func playMusic(audio: AudioStreamPlayer):
	
	match audio:
		MainMenuMusic:
			MainMenuMusic.play()
			isMusicPlaying = true


func stopMusic(audio: AudioStreamPlayer):
	
	match audio:
		MainMenuMusic:
			MainMenuMusic.stop()
			isMusicPlaying = false

func playSFX(audio: AudioStreamPlayer):
	
	match audio:
		coin:
			if not coin.is_playing():
				coin.play()
		win:
			win.play()
		jump:
			jump.play()
			
		_:
			print("There's no audio!")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
