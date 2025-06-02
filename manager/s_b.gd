extends Node

##################################################
signal coin_collected_signal(value: int)

##################################################
func coin_collected(value: int) -> void:
	emit_signal("coin_collected_signal", value)
