-- Generic enemy gravtiy aware

GravityAwareEnemy = Enemy:extend
{
    onNew = function(self)
        local gravity = GravityAwareActor:new()
        
        self.addAction(gravity)
    end
}