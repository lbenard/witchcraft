extends Camera2D

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				zoom *= Vector2.ONE * 0.95;
			if event.button_index == BUTTON_WHEEL_DOWN:
				zoom *= Vector2.ONE * 1.05;
