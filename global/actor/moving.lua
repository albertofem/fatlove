MovingActor = Class:new
{
    speed = {
        x = 25,
        y = 5
    },
    
    leftKey = "left",
    rightKey = "right",
    
    onUpdate = function(self, actor)
        if(the.keys:pressed(self.rightKey)) then
            actor.x = actor.x+self.speed.x;
        end
        
        if(the.keys:pressed(self.leftKey)) then
            actor.x = actor.x-self.speed.x;
        end
    end
}