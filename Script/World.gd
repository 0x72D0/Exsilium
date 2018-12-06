extends TileMap

signal Generation_finished

# load some external scene
var mapForm = load("res://Scene/Map01.tscn").instance()
onready var globals = get_node("/root/globals")

# prepare tileForm id value
var tileFormSet = mapForm.get_tileset()
var waterForm = tileFormSet.find_tile_by_name("Water")
var landForm = tileFormSet.find_tile_by_name("Land")

# prepare tile id value
var tileSet = self.get_tileset()
var grass = tileSet.find_tile_by_name("Grass")
var dirt = tileSet.find_tile_by_name("Dirt")
var water = tileSet.find_tile_by_name("Water")
var border = tileSet.find_tile_by_name("Border")

# constant
var worldSize = Vector2(mapForm.get_used_rect().size.x, mapForm.get_used_rect().size.y)

func generate_land(x, y):
	for i in range(globals.chunk_size.x):
		for j in range(globals.chunk_size.y):
			match randi()%2:
				0:self.set_cell(x*globals.chunk_size.x + i, y*globals.chunk_size.y + j, grass)
				1:self.set_cell(x*globals.chunk_size.x + i, y*globals.chunk_size.y + j, dirt)

func generate_water(x, y):
	for i in range(globals.chunk_size.x):
		for j in range(globals.chunk_size.y):
			self.set_cell(x*globals.chunk_size.x + i, y*globals.chunk_size.y + j, water)
			
func generate_border(total_x, total_y):
	#left and right border
	for i in range(globals.chunk_size.y*total_y):
		self.set_cell(-1, i, border)
		self.set_cell(globals.chunk_size.x*total_x, i, border)
	#up and down border
	for j in range(globals.chunk_size.x*total_x):
		self.set_cell(j, -1, border)
		self.set_cell(j, globals.chunk_size.y*total_y, border)
	pass

func _ready():
	self.connect("Generation_finished", get_node("/root/Game"), "_handle_generationFinished")
	randomize()
	for i in range(worldSize.x):
		for j in range(worldSize.y):
			match mapForm.get_cell(i, j):
				landForm: generate_land(i, j)
				waterForm: generate_water(i, j)
				_: print("error tile not found")
	generate_border(worldSize.x, worldSize.y)
	emit_signal("Generation_finished")