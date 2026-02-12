class_name SoundSystem extends Node

var isMusicPlaying : bool = false

var music_set = {AudioStreamPlayer: MainMenuMusic}



@export var game_manager : Game_Manager

@export var coin : AudioStreamPlayer
@export var win : AudioStreamPlayer
@export var jump : AudioStreamPlayer
@export var jump2 : AudioStreamPlayer
@export var youWin : AudioStreamPlayer
@export var winJingle : AudioStreamPlayer
@export var MainMenuMusic : AudioStreamPlayer
@export var BasicLevel : AudioStreamPlayer 

#AudioStream version of this method
@export var mainMenu : AudioStream
@export var basicLevel : AudioStream
@export_range(-80.0, 24.0) var mainMenuVol : float = -15.0
@export_range(-80.0, 24.0) var basicLevelVol : float = -10.0
@export_range(-80.0, 24.0) var speakerVol : float 

@export var speaker : AudioStreamPlayer

@export var SFX : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#speakerVol = speaker.volume_db
	pass

func playMusic(audio: AudioStreamPlayer):
	
	match audio:
		MainMenuMusic:
			#MainMenuMusic.play()
			#speaker.stream = mainMenu
			#speaker.volume_db = mainMenuVol
			
			speaker = MainMenuMusic
			speaker.play()
			
		BasicLevel:
			#BasicLevel.play()
			#speaker.stream = basicLevel
			#speaker.volume_db = basicLevelVol
			
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
		
		jump2:
			SFX = jump2
			SFX.play()
		
		youWin:
			SFX = youWin
			SFX.play()
		winJingle:
			SFX = winJingle
			SFX.play()
		_:
			print("There's no audio!")
			
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
