extends RigidBody2D

func _ready(): # Run when initialized
	contact_monitor = true # pay attn to whether I'm hittin' something
	set_max_contacts_reported(4) 
	
func _physics_process(delta): # one of two func kind of like update in Python Arcade
	var bodies = get_colliding_bodies() # check for collision, basically
	for body in bodies:
		if body.is_in_group("Tiles"): # I only want the tiles to disappear, that's why we made a group
			body.queue_free() #get rid of it! .kill()
			
	if position.y > get_viewport_rect().end.y:
		queue_free() # get rid of the ball if it goes off screen
		print("YOU DIED")