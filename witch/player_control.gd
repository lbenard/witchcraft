extends Node

export var speed: float = 5.0;
export var sprint_multiplier = 1.5;
var _unit = 16.0;

onready var _sprite = get_parent().get_node("AnimatedSprite");

func _physics_process(_delta):
	var velocity: Vector2 = Vector2.ZERO;
	if Input.is_action_pressed("player_up"):
		_sprite.animation = "walking_north";
		velocity += Vector2.UP;
	if Input.is_action_pressed("player_down"):
		_sprite.animation = "walking_south";
		velocity += Vector2.DOWN;
	if Input.is_action_pressed("player_right"):
		_sprite.animation = "walking_east";
		velocity += Vector2.RIGHT;
	if Input.is_action_pressed("player_left"):
		_sprite.animation = "walking_west";
		velocity += Vector2.LEFT;
	
	velocity = velocity.normalized() * speed * _unit;
	if Input.is_action_pressed("player_sprint"):
		velocity *= sprint_multiplier;
		_sprite.speed_scale = sprint_multiplier;
	else:
		_sprite.speed_scale = 1.0;
	
	if velocity.length_squared() > 0.001:
		_sprite.play();
	else:
		_sprite.stop();
	get_parent().move_and_slide(velocity);
