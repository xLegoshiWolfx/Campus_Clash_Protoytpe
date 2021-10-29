extends Label


func _ready():
	pass
	
func _process(delta):
	text = "Campus Coins: " + str(get_parent().human_currency)
