GravityAwareActor = Class:extend
{
    onCollide = function(self, actor, other, horizOverlap, vertOverlap)
        actor.jumping.canJump = true
        
        if actor.velocity.y > 0 and ((other.x < actor.x+actor.width) and (other.x+other.width > actor.x)) then
            actor.velocity.y = 0
        end
    end
}