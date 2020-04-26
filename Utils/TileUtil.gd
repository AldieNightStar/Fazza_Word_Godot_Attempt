class_name TileUtil

var _map : TileMap 

func _init(map: TileMap):
	self._map = map
	
func get_cell(x, y):
	return _map.get_cell(x, y)

func set_cell(x, y, id):
	_map.set_cell(x, y, id)

func get_cell_pos_from_world_pos(x, y):
	# return _map.map_to_world(  _map.world_to_map(Vector2(x, y) - _map.global_position)  ) / _map.cell_size
	var map_pos = _map.world_to_map(Vector2(x, y) - _map.global_position)
	var world_pos = _map.map_to_world(  map_pos  ) / _map.cell_size
	return world_pos
	
func get_world_pos_from_cell_pos(x, y):
	# return _map.map_to_world(  Vector2(x, y)  ) - (_map.global_position / _map.cell_size )
	var tile_pos = Vector2(x, y)
	var world_pos = _map.map_to_world(tile_pos) - (_map.global_position / _map.cell_size )
	return world_pos

func get_cell_world(x, y):
	var coord = get_cell_pos_from_world_pos(x, y)
	return _map.get_cell(coord.x, coord.y)

func set_cell_world(x, y, id):
	var coord = get_cell_pos_from_world_pos(x, y)
	return _map.set_cell(coord.x, coord.y, id)

class CellCoord:
	var x : int
	var y : int
	func _init(x: int, y: int):
		self.x = x
		self.y = y
	func _to_string():
		return "CellCoord: " + str(x) + ", " + str(y)
