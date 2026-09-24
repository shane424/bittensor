class_name DebugLog
extends RefCounted

static func info(message: String) -> void:
	if OS.is_debug_build():
		print("[AgesOfTheDead] %s" % message)
