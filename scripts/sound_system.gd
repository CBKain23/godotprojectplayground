class_name SoundSystem extends Node

var isMusicPlaying : bool = false

var music_set = {AudioStreamPlayer: MainMenuMusic}



@export var game_manager : Game_Manager

#AudiostreamPlayers for the SFX and Music
@onready var coin : AudioStreamPlayer = %CoinPickUpSFX
@onready var win : AudioStreamPlayer = %WinSFX
@onready var jump : AudioStreamPlayer = %Jump1SFX
@onready var jump2 : AudioStreamPlayer = %Jump2SFX
@onready var youWin : AudioStreamPlayer = %YouWinSFX
@onready var winJingle : AudioStreamPlayer = %WinJingleSFX
@onready var click : AudioStreamPlayer = %ClickSFX
@onready var MainMenuMusic : AudioStreamPlayer = %MainMenuMusic
@onready var BasicLevel : AudioStreamPlayer  = %"2DBasicLevelMusic"

#AudioStream version of this method
var mainMenuStream : AudioStream = preload("uid://7yys7eh5afp4")
var basicLevelStream : AudioStream = preload("uid://bor7xooyli1sf")
var coinStream : AudioStream = preload("uid://d2ks5ipt2hy26")
var winStream : AudioStream = preload("uid://b6pt8ss5h8ql6")
var jumpStream : AudioStream = preload("uid://c5x7cvmna3sij")
var jump2Stream : AudioStream = preload("uid://bckg2g68pevc0")
var youWinStream : AudioStream = preload("uid://bt27bwri1v6x7")
var winJingleStream : AudioStream = preload("uid://dv1uo65p42bq5")
var clickStream : AudioStream = preload("uid://by2ahj7su4ynt")




@export_range(-80.0, 24.0) var mainMenuVol : float = -15.0
@export_range(-80.0, 24.0) var basicLevelVol : float = -10.0
@export_range(-80.0, 24.0) var speakerVol : float 

#The Audiostreamplayers for the players of SFX and music
@export var speaker : AudioStreamPlayer
@export var SFX : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#speakerVol = speaker.volume_db
	pass

##Play the Music
func playMusic(audio: AudioStreamPlayer):
	
	match audio:
		MainMenuMusic:
			#MainMenuMusic.play()
			#speaker.stream = mainMenu
			#speaker.volume_db = mainMenuVol
			
			speaker = MainMenuMusic
			#speaker.stream = mainMenuStream
			#speaker
			speaker.play()
			
		BasicLevel:
			#BasicLevel.play()
			#speaker.stream = basicLevel
			#speaker.volume_db = basicLevelVol
			
			speaker = BasicLevel
			#speaker.stream = basicLevelStream
			speaker.play()
	

##Pause the music
func pauseMusic():
	speaker.stream_paused = true

##Unpause the music
func unpauseMusic():
	speaker.stream_paused = false

##Stop the music
func stopMusic():
	
	#match audio:
		#MainMenuMusic:
			#MainMenuMusic.stop()
			#
		#
		#BasicLevel:
			#BasicLevel.stop()
	
	speaker.stop()
	


##Play the SFX
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
		
		click:
			SFX = click
			SFX.play()
		_:
			print("There's no audio!")
			
	

##Play the button click SFX
func buttonClick():
	playSFX(click)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
