Level1 = View:new
{
        onNew = function(self)
                -- Add the player's character
                self.player = Player:new(),
                self:add(self.player),

                -- Add the enemies of the stage
                self.enemies = {},

                for i=1, 20 do 
                	self.enemies[i] = Enemy:extend{
                						
                					}
                end
        end
}