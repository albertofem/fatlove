JumpingActor = Class:extend
{
    triggerKey = "up",

    canJump = true,
	
	length = 300,
    
    sound = 'global/assets/sounds/jump.wav',

    onUpdate = function(self, actor)
        if(the.keys:justPressed(self.triggerKey) and self.canJump == true) then
            if self.sound then playSound(self.sound) end
			
			-- Do stuff with animations
			actor:switchSequence('jumping')
			
			if the.keys:pressed(actor.movement.leftKey) then
				actor:play('left')
			else
				actor:play('right')
			end
			
            self.canJump = false
            actor.velocity.y = -1 * self.length
		end
		
		if self.canJump == false then
			if actor.velocity.y >= 0 then
				if the.keys:pressed(actor.movement.leftKey) then
					actor:play('falling_left')
				else
					actor:play('falling_right')
				end
			end
		end
    end,
	
	onFloor = function(self, actor)
		if actor:activeSequence('jumping') then
			if actor.velocity.x >= 0 then
				actor:play('floor_right')
			else
				actor:play('floor_left')
			end
		end
	end
}