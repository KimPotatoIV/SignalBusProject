extends CanvasLayer

##################################################
var game_score_label: Label

var hud_game_score: int = 0

##################################################
func _ready() -> void:
	game_score_label = $MarginContainer/GameScoreLabel

##################################################
func _process(delta: float) -> void:
	if not hud_game_score == GM.get_game_score():
		hud_game_score = GM.get_game_score()
		game_score_label.text = "SCORE: " + str(hud_game_score)
