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

@export var health_container: int = 12
@export var health: float = 6
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
	
	self.health_container += health_container if health_container < MAX_HEALTH_CONTAINERS \
											or health_container > MIN_HEALTH_CONTAINERS else 0
	self.health += health if health < MAX_HEALTH or health > MIN_HEALTH else 0
	self.damage += damage if damage < MAX_DAMAGE or damage > MIN_DAMAGE else 0
	self.dmg_multiplier += dmg_multiplier if dmg_multiplier < MAX_DMG_MULIPLIER \
										or dmg_multiplier > MIN_DMG_MULIPLIER else 0
	self.speed += speed if speed < MAX_SPEED or speed > MIN_SPEED else 0
	self.luck += luck if luck < MAX_LUCK or luck > MIN_LUCK else 0
	
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
