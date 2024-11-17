extends Node

# wait(t): await get_tree().create_timer(t).timeout

func time():
	Time.get_unix_time_from_system()
