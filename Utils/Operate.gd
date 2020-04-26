extends Node

class_name Operate

class Operation:
	var ref: FuncRef
	var params
	func _init(obj, func_name: String, params: Array):
		self.ref = funcref(obj, func_name)
		self.params = params
	func invoke():
		ref.call_funcv(params)

class Operations:
	var ops = []
	var locked = false
	func add(op: Operation):
		if !locked:
			ops.append(op)
	func clear():
		if !locked:
			ops.clear()
	func invoke_all(clear_after_invoke: bool):
		locked = true
		for op in ops:
			op.invoke()
		locked = false
		if (clear_after_invoke): ops.clear()
