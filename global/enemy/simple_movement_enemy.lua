-- Generic enemy move aware

SimpleMovementEnemy = Class:extend
{
	id = "movement_enemy",

    onUpdate = function(self, enemy)
    	enemy.x = (enemy.direction) * (enemy.x + enemy.velocity.x)
	end
}