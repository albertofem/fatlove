MovingActor = Class:new
{
    speed = {
        x = 5,
        y = 5
    },
    
    leftKey = "left",
    rightKey = "right",
    
    onUpdate = function(self, actor)
        if(the.keys:pressed(self.rightKey)) then
            actor:play('right')
            actor.x = actor.x+self.speed.x;
        end
        
        if(the.keys:pressed(self.leftKey)) then
            actor:play('left')
            actor.x = actor.x-self.speed.x;
        end
    end
}