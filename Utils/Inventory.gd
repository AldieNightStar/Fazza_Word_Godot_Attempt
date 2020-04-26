extends Object

class_name Inventory

var slots = {}
const MAX_SLOTS = 15
const MAX_STACK = 1000
const MAX_ITEM_ID = 4

func add_item(item_id: int, cnt: int) -> bool:
	if (!item_id_validate(item_id)): return false
	if (cnt > MAX_STACK): return false
	if (cnt <= 0): return false
	var items = get_item_count(item_id)
	if (items + cnt > MAX_STACK):
		return false
	slots[item_id] += cnt
	return true

func get_item_count(item_id: int) -> int:
	if (!item_id_validate(item_id)): return 0
	if !(item_id in slots):
		slots[item_id] = 0
	return slots[item_id]

func remove_item_count(item_id: int, cnt: int) -> bool:
	if (!item_id_validate(item_id)): return false
	if (cnt <= 0): return false
	var items = get_item_count(item_id)
	if (items < 1): return false
	if (items - cnt < 0): return false
	slots[item_id] = items - cnt
	return true

func get_item_list():
	var list = []
	for item in slots:
		if (item is int and item > 0):
			list.append(item)
	return list

func item_id_validate(item_id: int) -> bool:
	return (item_id >= 0) and (item_id < MAX_ITEM_ID)
