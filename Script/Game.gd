extends Node

var player = load("res://Scene/Player.tscn").instance()
var root_fruit = load("res://Scene/fruit_root.tscn")
var object_pos = Array()

func _add_to_map(tileID, position):
	var tile = load(globals._Tile_path[tileID]).instance()
	if(tile.has_user_signal("add_to_map")):
		tile.connect("add_to_map", self, "_add_to_map")
	call_deferred("add_child", tile)
	tile.set_position(position)
	pass

func generate_root():
	randomize()
	var root_num = 20
	while(root_num > 0):
		var Obj = root_fruit.instance()
		call_deferred("add_child", Obj)
		var globals = get_node("/root/globals")
		var world = get_node("World")
		var random_x = randi()%int(world.get_used_rect().size.x)
		var random_y = randi()%int(world.get_used_rect().size.y)
		if((world.get_cell(random_x, random_y) == world.grass or world.get_cell(random_x, random_y) == world.dirt) and object_pos.find(Vector2(random_x, random_y)) == -1):
			Obj.set_position(Vector2((random_x*globals.tileSize.x) + globals.tileSize.x/2, (random_y*globals.tileSize.y) + globals.tileSize.y/2))
			Obj.connect("add_to_map", self, "_add_to_map")
			object_pos.append(Vector2(random_x, random_y))
			root_num -= 1
		else:
			Obj.queue_free()
	pass

func generate_object():
	generate_root()
	pass

# signal in WorldGen.gd
func _handle_generationFinished():
	randomize()
	call_deferred("add_child", player)
	var globals = get_node("/root/globals")
	var world = get_node("World")
	while(world.get_cell((player.get_position().x/globals.tileSize.x), (player.get_position().y/globals.tileSize.y)) == world.water):
		var random_x_location = (randi()%int(world.get_used_rect().size.x))*globals.tileSize.x
		var random_y_location = (randi()%int(world.get_used_rect().size.y))*globals.tileSize.y
		player.set_position(Vector2(random_x_location + globals.tileSize.x/2, random_y_location+globals.tileSize.y/2))
		object_pos.append(Vector2(random_x_location/globals.tileSize.x, random_y_location/globals.tileSize.y))
	generate_object()
	
func _ready():
	pass