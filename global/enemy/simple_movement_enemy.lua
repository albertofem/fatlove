-- Generic enemy move aware

SimpleMovementEnemy = Class:extend
{
	speed = 0,
	direction = 1,

    onNew = function(self)        
    end,

    onUpdate = function(self, enemy)
    	enemy.x = enemy.x + (self.direction * self.speed)
	end
}