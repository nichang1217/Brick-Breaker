extends RigidBody2D

class_name Brick

signal brick_destroyed

var level = 1

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var brick_break = $BrickBreak
@onready var brick_break2 = $BrickBreak2
@onready var brick_break3 = $BrickBreak3
@onready var brick_break4 = $BrickBreak4
@onready var brick_break5 = $BrickBreak5
@onready var brick_break6 = $BrickBreak6

var sprites: Array[Texture2D] = [
	preload("res://Assets/Brick-Yellow.png"),
	preload("res://Assets/Brick-Blue.png"),
	preload("res://Assets/Brick-Orange.png"),
	preload("res://Assets/Brick-Green.png"),
	preload("res://Assets/Brick-Gray.png"),
	preload("res://Assets/Brick-Red.png")
]

func get_size():
	return collision_shape_2d.shape.get_rect().size * sprite_2d.scale
	
	
func set_level(new_level: int):
	level = new_level
	sprite_2d.texture = sprites[new_level - 1]
	
func decrease_level():
	if level == 1:
		fade_out()
		brick_break.emitting = true
		
	if level == 2:
		set_level(level - 1)
		brick_break2.emitting = true
	
	if level == 3:
		set_level(level - 1)
		brick_break3.emitting = true
		
	if level == 4:
		set_level(level - 1)
		brick_break4.emitting = true
		
	if level == 5:
		set_level(level - 1)
		brick_break5.emitting = true
		
	if level == 6:
		set_level(level - 1)
		brick_break6.emitting = true
		
	#if level > 1:
	#	set_level(level - 1)
	#	brick_break.emitting = true
	#else:
	#	fade_out()
	#	brick_break.emitting = true
		
func fade_out():
	collision_shape_2d.disabled = true
	var tween = get_tree().create_tween()
	tween.tween_property(sprite_2d, "modulate", Color.TRANSPARENT, .5)
	tween.tween_callback(destroy)
	
func destroy():
	queue_free()
	brick_destroyed.emit()
	
func get_width():
	return get_size().x

