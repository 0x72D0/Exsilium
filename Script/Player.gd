extends KinematicBody2D

signal interact_signal

onready var ActionText = get_node("CharacterCamera/Action_text")
onready var progressBar = get_node("CharacterCamera/ProgressBar")
onready var Inventory = get_node("CharacterCamera/Inventory_panel/Inventory")
onready var Crafting = get_node("CharacterCamera/Crafting_panel/Crafting")
onready var globals = get_node("/root/globals")
var movementSpeed = 300
var movement = Vector2(0,0)
var progressBarTimer = Timer.new()

var menu_open = false

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _hide_progressBar():
	progressBar.hide()

func _return_interaction(progress, item_id=null, num=null):
	if(item_id != null and num != null):
		add_new_item(item_id, num)
	progressBar.show()
	progressBar.set_value(progress)
	progressBarTimer.start()

func timing_actionText(text, time):
	ActionText.show()
	ActionText.clear()
	ActionText.add_text(text)
	yield(get_tree().create_timer(time),"timeout")
	ActionText.hide()
	

func verify_item(object_id, num):
	return Inventory.verify_item(object_id, num)

func destroy_item(object_id, num):
	Inventory.destroy_item(object_id, num)

func add_new_item(object_id, num):
	Inventory.add_new_item(object_id,num)

func _ready():
	progressBarTimer.set_wait_time(1)
	progressBarTimer.connect("timeout",self,"_hide_progressBar")
	add_child(progressBarTimer)

func _physics_process(delta):
	movement = Vector2(0,0)
	
	if Input.is_action_pressed("character_up"):
		movement += Vector2(0, -1)
	if Input.is_action_pressed("character_down"):
		movement += Vector2(0, 1)
	if Input.is_action_pressed("character_left"):
		movement += Vector2(-1, 0)
	if Input.is_action_pressed("character_right"):
		movement += Vector2(1, 0)
	if Input.is_action_just_pressed("character_interaction"):
		emit_signal("interact_signal")
		
	var motion = movement.normalized() * movementSpeed
	move_and_slide(motion,Vector2(0,0))

#func _process(delta):
#	pass
