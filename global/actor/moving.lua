MovingActor = Class:new
{
    speed = {
        x = 6,
        y = 5
    },
    
    leftKey = "left",
    rightKey = "right",
    
    blockXMaxPos = false,
    
    onUpdate = function(self, actor)
        if(the.keys:pressed(self.rightKey)) then
            if not self.blockXMaxPos then
                actor.x = actor.x+self.speed.x;
            end
        end
        
        if(the.keys:pressed(self.leftKey)) then
            actor.x = actor.x-self.speed.x;
        end
    end
}