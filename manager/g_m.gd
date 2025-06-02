extends Node

##################################################
var game_score: int = 0

##################################################
func _ready() -> void:
	SB.connect("coin_collected_signal", Callable(self, "_on_coin_collected_signal"))

##################################################
func _on_coin_collected_signal(value: int) -> void:
	game_score += value

##################################################
func get_game_score() -> int:
	return game_score
