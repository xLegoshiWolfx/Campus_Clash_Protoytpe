extends Label


func _process(delta):
	text = "Campus Coins: " + str(get_parent().human_currency)
