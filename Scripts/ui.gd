extends CanvasLayer

class_name UI

@onready var lifes_label = %LifesLabel

func set_lifes(lifes: int):
	lifes_label.text = "Lifes %d" % lifes


func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()
