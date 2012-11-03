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
				actor.flipX = true
			else
				actor.flipX = false
			end
			
			actor:play('jumping')
			
            self.canJump = false
            actor.velocity.y = -1 * self.length
        elseif(not the.keys:justPressed(self.triggerKey) and self.canJump == true) then
        	actor:switchSequence('walking')
			
			if the.keys:pressed(actor.movement.leftKey) then
				actor.flipX = true
			else
				actor.flipX = false
			end
				
			actor:play('walking')
		end
		
		if self.canJump == false then
			if actor.velocity.y >= 0 then
				if the.keys:pressed(actor.movement.leftKey) then
					actor.flipX = true
				else
					actor.flipX = false
				end
					
				actor:play('falling')
			end
		end
    end,
	
	onFloor = function(self, actor)
		if actor:activeSequence('jumping') then
			if actor.velocity.x >= 0 then
				actor.flipX = true
			else
				actor.flipX = false
			end
			
			actor:play('floor')
		end
	end
}