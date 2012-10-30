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

-- TODO: Subview draws multiple time the same tile
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
        
        gravity = { x = 300, y = 300 },
        
        height = 150,
        
        length = 150,

        onUpdate = function(self, actor)
                if(self.jumping == false) then
                        self.x = actor.x
                        self.y = actor.y
                end
                
                if(the.keys:justPressed(self.triggerKey) and self.jumping == false) then
                        self.jumping = true
                        
                        actor.x = self:calculateJumpX()
                        actor.y = self:calculateJumpY()
                end
        end,
        
        calculateJumpX = function(self)
                -- calcular hasta donde llega el salto en base a la aceleración
                if(the.keys:pressed("right")) then
                        self.x = self.acceleration+self.x
                end
                
                if(the.keys:pressed("left")) then
                        self.x = self.x-self.acceleration
                end
                
                return self.x
        end,
        
        calculateJumpY = function(self)
                self.y = self.acceleration+self.y
                
                return self.y
        end
}

MovingActor = Class:new
{
    onUpdate = function(self, actor)
        if(the.keys:pressed("right")) then
            actor.x = actor.x+5;
        end
        
        if(the.keys:pressed("left")) then
            actor.x = actor.x-5;
        end
            
        if(the.keys:pressed("up")) then
            actor.y = actor.y-5
        end
            
        if(the.keys:pressed("down")) then
            actor.y = actor.y+5;
        end
    end
}

ShotingActor = {
        -- definir que tipo de disparo se hará
        -- angulo en el que realizar el disparo
        -- 
}

