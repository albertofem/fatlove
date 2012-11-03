ShootingActor = Class:extend
{
    angle = 180,
    
    triggerKey = "s",
    
    onUpdate = function(self, actor)
		
		if not self.triggerKey then
			return
		end
        
        if self.calculateShootingAngle then
            self.angle = self:calculateShootingAngle(actor)
        end
        
        if(the.keys:justPressed(self.triggerKey)) then
            
            playSound('global/assets/sounds/shoot.wav')
            
            local bullet = self.bullet:new()
            
            bullet.active = true
            bullet.visible = true
            
            bullet.x = actor.x+5
            bullet.y = actor.y+5
            
            if not bullet.angle then
                bullet.angle = self.angle
            end
            
            print("Shooting in this angle: ", bullet.angle)
            
            if not bullet.onUpdate then
                bullet.onUpdate = function(self)
                    if self.angle > 0 and self.angle < 90 then
                        -- sum x and y
                        self.x = self.x+self.speed.x
                        self.y = self.y-self.speed.y
                    elseif self.angle == 90 then
                        -- sum y only
                        self.y = self.y-self.speed.y
                    elseif self.angle > 90 and self.angle < 180 then
                        -- diff x and sum y
                        self.x = self.x-self.speed.x
                        self.y = self.y-self.speed.y
                    elseif self.angle == 180 then
                        -- diff x
                        self.x = self.x-self.speed.x
                    elseif self.angle == 0 then
                        -- diff x
                        self.x = self.x+self.speed.x
                    elseif self.angle > 180 and self.angle < 270 then
                        -- diff x and diff y
                        self.x = self.x-self.speed.x
                        self.y = self.y+self.speed.y
                    elseif self.angle == 270 then
                        -- diff y
                        self.y = self.y+self.speed.y
                    else
                        -- diff y sum x
                        self.x = self.x+self.speed.x
                        self.y = self.y+self.speed.y
                    end
                    
                    for index, target in pairs(self.collisionMap) do
                        self:collide(target)
                    end
                end
            end
            
            the.view:add(bullet)
            
        end
    end
}
