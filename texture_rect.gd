extends Control

# ลากรูปภาพคัทซีนทั้งหมดมาใส่ในช่องนี้ทาง Inspector
@export var cutscene_images: Array[Texture2D]
@export var next_scene: PackedScene # ลาก level_01.tscn มาใส่

@onready var texture_rect = $TextureRect

var current_index: int = 0

func _ready():
	if cutscene_images.size() > 0:
		texture_rect.texture = cutscene_images[0]

func _input(event):
	# คลิกเมาส์ซ้าย หรือกด Spacebar/Enter เพื่อเปลี่ยนภาพ
	if event.is_action_pressed("ui_accept") or (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT):
		next_image()

func next_image():
	current_index += 1
	if current_index < cutscene_images.size():
		texture_rect.texture = cutscene_images[current_index]
	else:
		start_game()

func start_game():
	if next_scene != null:
		SceneTransition.load_scene(next_scene)
	else:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_01.tscn")
