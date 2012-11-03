GravityAwareActor = Class:extend
{
    onCollide = function(self, actor, other, horizOverlap, vertOverlap)
        if other.solid then  
            if actor.jumping then
                actor.jumping.canJump = true
                actor.jumping:onFloor(actor)
                
                -- Update animation to walking
                if other:instanceOf(Floor) then
                    actor:switchSequence('walking')
                end
            end
            
            if(other:instanceOf(Enemy)) then
                actor.velocity.y = 0
            elseif actor.velocity.y > 0 and ((other.x < actor.x+actor.width) and (other.x+other.width > actor.x)) then
                actor.velocity.y = 0
            end
        end
    end
}