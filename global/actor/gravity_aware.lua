GravityAwareActor = Class:extend
{
    onCollide = function(self, actor, other, horizOverlap, vertOverlap)
        if other.solid then  
            if actor.jumping then
                actor.jumping.canJump = true
            end
            
            if actor.velocity.y > 0 and ((other.x < actor.x+actor.width) and (other.x+other.width > actor.x)) then
                actor.velocity.y = 0
            end
        end
    end
}