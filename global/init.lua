-- Generic dialogs

DialogBackground = Tile:extend
{
        width = 400,
        height = 400,
        
        image = 'global/assets/graphics/ui/dialog.png',
        
        onNew = function(self)
                self.x = (the.app.width / 2) - (self.width / 2);
                self.y = (the.app.height / 2) - (self.height / 2);  
        end
}

Dialog = Subview:extend
{
    onActivate = function(self)
            if not self.dialog then self.dialog = DialogBackground:new() end
            self:add(self.dialog)
    end,
    
    onDeactivate = function(self)
        self:remove(self.dialog)
    end,
    
    onUpdate = function(self)
        if(the.mouse:justPressed("r")) then
            self:deactivate()
        end
    end
}

Cursor = Tile:new
{
    image = 'global/assets/graphics/cursor.png',
    
    onNew = function(self)
        love.mouse.setVisible(false)
        love.mouse.setGrab(false)
    end,
    
    onUpdate = function(self)
       self.x = love.mouse.getX() - self.width / 2
       self.y = love.mouse.getY() - self.height / 2
    end
}

JumpingActor = Class:new
{
    triggerKey = "up",

    jumping = false,
    
    sound = "",

    onUpdate = function(self, actor)
        if(the.keys:justPressed(self.triggerKey) and self.jumping == false) then
            if sound then playSound(self.sound) end
            self.jumping = true
            actor.velocity.y = -273
        end
    end,

    onCollide = function(self, actor)
        if actor.velocity.y > 0 then
            actor.velocity.y = 0
            self.jumping = false
        end
    end
}

MovingActor = Class:new
{
    verticalMovement = false,
    
    onUpdate = function(self, actor)
        if(the.keys:pressed("right")) then
            actor.x = actor.x+5;
        end
        
        if(the.keys:pressed("left")) then
            actor.x = actor.x-5;
        end
            
        if self.verticalMovement then
            if(the.keys:pressed("up")) then
                actor.y = actor.y-5
            end
            
            if(the.keys:pressed("down")) then
                actor.y = actor.y+5;
            end
        end
    end
}

ShotingActor = {
        -- definir que tipo de disparo se hará
        -- angulo en el que realizar el disparo
        -- 
}

