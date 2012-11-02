MovingActor = Class:new
{
    speed = {
        x = 5,
        y = 5
    },
    
    onUpdate = function(self, actor)
        if(the.keys:pressed("right")) then
            actor.x = actor.x+self.speed.x;
        end
        
        if(the.keys:pressed("left")) then
            actor.x = actor.x-self.speed.x;
        end
    end
}