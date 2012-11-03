-- Generic enemy move aware

SimpleMovementEnemy = Class:extend
{
	id = "movement_enemy",
	
	direction = 1,

    onUpdate = function(self, enemy)
    	enemy.x = (self.direction) * (enemy.x + enemy.velocity.x)
	end
}