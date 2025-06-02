extends Node

##################################################
signal this_is_signal_1
signal this_is_signal_2(value: int)

##################################################
func _ready() -> void:
	self.connect("this_is_signal_1", Callable(self, "_on_this_is_signal_1"))
	self.connect("this_is_signal_2", Callable(self, "_on_this_is_signal_2"))

	do_something_1()
	do_something_2(88)

##################################################
func do_something_1() -> void:
	emit_signal("this_is_signal_1")

##################################################
func do_something_2(value: int) -> void:
	emit_signal("this_is_signal_2", value)

##################################################
func _on_this_is_signal_1() -> void:
	print("신호 1 수신!")

##################################################
func _on_this_is_signal_2(value: int) -> void:
	print("신호 2 수신! 값: ", value)
