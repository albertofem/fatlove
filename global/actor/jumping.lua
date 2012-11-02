JumpingActor = Class:extend
{
    triggerKey = "up",

    jumping = false,
    
    sound = nil,

    onUpdate = function(self, actor)
        if(the.keys:justPressed(self.triggerKey) and self.jumping == false) then
            if self.sound then playSound(self.sound) end
            self.jumping = true
            actor.velocity.y = -273
		end
    end
}