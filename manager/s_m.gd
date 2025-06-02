extends Node

##################################################
const COIN_COLLECTED_SOUND = preload("res://sounds/coin.wav")
const JUMP_COLLECTED_SOUND = preload("res://sounds/jump.wav")

var coin_collected_sound_player: AudioStreamPlayer
var jump_sound_player: AudioStreamPlayer

##################################################
func _ready() -> void:
	SB.connect("coin_collected_signal", Callable(self, "_on_coin_collected_signal"))
	
	coin_collected_sound_player = AudioStreamPlayer.new()
	add_child(coin_collected_sound_player)
	coin_collected_sound_player.stream = COIN_COLLECTED_SOUND
	
	jump_sound_player = AudioStreamPlayer.new()
	add_child(jump_sound_player)
	jump_sound_player.stream = JUMP_COLLECTED_SOUND

##################################################
func _on_coin_collected_signal(value: int) -> void:
	coin_collected_sound_player.play()

##################################################
func jump_sound_play() -> void:
	jump_sound_player.play()
