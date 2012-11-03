JumpingActor = Class:extend
{
    triggerKey = "up",

    canJump = true,
    
    sound = 'global/assets/sounds/jump.wav',

    onUpdate = function(self, actor)
        if(the.keys:justPressed(self.triggerKey) and self.canJump == true) then
            if self.sound then playSound(self.sound) end
            self.canJump = false
            actor.velocity.y = -273
		end
    end
}