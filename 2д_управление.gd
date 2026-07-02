extends Node2D

var cameraState = "idle"
var maxAngle = 56

func cameraUpdate():
	print($"../Камера".rotation_degrees[1])
	match cameraState:
		"left":
			if $"../Камера".rotation_degrees[1] < maxAngle:
				$"../Камера".rotate_y(0.05)
		"right":
			if $"../Камера".rotation_degrees[1] > -maxAngle:
				$"../Камера".rotate_y(-0.05)
		"idle":
			if int($"../Камера".rotation_degrees[1]) != 0:
				if $"../Камера".rotation_degrees[1] > 0:
					$"../Камера".rotate_y(-0.05)
				elif $"../Камера".rotation_degrees[1] < 0:
					$"../Камера".rotate_y(0.05)
			else:
				$"../Камера".rotation_degrees[1] = 0.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	cameraUpdate()

# Функции при "наведении" на кнопку
func _on_left_mouse_entered() -> void:
	cameraState = "left"
	
func _on_right_mouse_entered() -> void:
	cameraState = "right"
	
func _on_center_mouse_entered() -> void:
	cameraState = "idle"
