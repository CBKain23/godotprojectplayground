class_name SoundSystem extends Node

var isMusicPlaying : bool = false

var music_set = {AudioStreamPlayer: MainMenuMusic}

@export var game_manager : Game_Manager

@export var coin : AudioStreamPlayer
@export var win : AudioStreamPlayer
@export var jump : AudioStreamPlayer
@export var MainMenuMusic : AudioStreamPlayer
@export var BasicLevel : AudioStreamPlayer 

@export var speaker : AudioStreamPlayer
@export var SFX : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	

func playMusic(audio: AudioStreamPlayer):
	
	match audio:
		MainMenuMusic:
			#MainMenuMusic.play()
			speaker = MainMenuMusic
			speaker.play()
			
		BasicLevel:
			#BasicLevel.play()
			speaker = BasicLevel
			speaker.play()
	


func pauseMusic():
	speaker.stream_paused = true

func unpauseMusic():
	speaker.stream_paused = false

func stopMusic():
	
	#match audio:
		#MainMenuMusic:
			#MainMenuMusic.stop()
			#
		#
		#BasicLevel:
			#BasicLevel.stop()
	
	speaker.stop()
	



func playSFX(audio: AudioStreamPlayer):
	
	match audio:
		coin:
			SFX = coin
			if not SFX.is_playing():
				SFX.play()
		win:
			SFX = win
			SFX.play()
			
		jump:
			SFX = jump
			SFX.play()
			
		_:
			print("There's no audio!")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
