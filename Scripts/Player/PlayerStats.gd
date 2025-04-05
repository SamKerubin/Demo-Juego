extends Resource
class_name PlayerStats

signal re_asign_stats

const MAX_HEALTH_CONTAINERS: int = 12
const MIN_HEALTH_CONTAINERS: int = 0

const MAX_HEALTH: float = 12
const MIN_HEALTH: float = 0

const MAX_DAMAGE: float = 2_147_483_647
const MIN_DAMAGE: float = 0.1

const MAX_DMG_MULIPLIER: float = 2_147_483_647
const MIN_DMG_MULIPLIER: float = 0.1

const MAX_SPEED: float = 2
const MIN_SPEED: float = 0.1

const MAX_LUCK: float = 2_147_483_647
const MIN_LUCK: float = -2_147_483_648

@export var health_container: int = 3
@export var health: float = 3
@export var damage: float = 3.4
@export var dmg_multiplier: float = 1
@export var speed: float = 1
@export var luck: float = 0

func _modify_stats_permanent(new_stats: Dictionary[String, float]) -> void:
	var health_container: int = new_stats.get("health_container", 0)
	var health: float = new_stats.get("health", 0)
	var damage: float = new_stats.get("damage", 0)
	var dmg_multiplier: float = new_stats.get("dmg_multiplier", 0)
	var speed: float = new_stats.get("speed", 0)
	var luck: float = new_stats.get("luck", 0)
	
	self.health_container = clamp(self.health_container + health_container, MIN_HEALTH_CONTAINERS, MAX_HEALTH_CONTAINERS)
	self.health = clamp(self.health + health, MIN_HEALTH, MAX_HEALTH)
	self.damage = clamp(self.damage + damage, MIN_DAMAGE, MAX_DAMAGE) 
	self.dmg_multiplier = clamp(self.dmg_multiplier + dmg_multiplier, MIN_DMG_MULIPLIER, MAX_DMG_MULIPLIER)
	self.speed = clamp(self.speed + speed, MIN_SPEED, MAX_SPEED)
	self.luck = clamp(self.luck + luck, MIN_LUCK, MAX_LUCK) 
	
	re_asign_stats.emit()

func to_dict() -> Dictionary[String, float]:
	return {
		"health_container": health_container,
		"health": health,
		"damage": damage,
		"dmg_multiplier": dmg_multiplier,
		"speed": speed,
		"luck": luck
	}
