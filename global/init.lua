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
                self.dialog = DialogBackground:new()
                self:add(self.dialog)
        end
}

JumpingActor = {
        triggerKey = "up",
        
        jumping = false,
        
        gravity = 350,
        
        height = 150,
        
        length = 150,

        onUpdate = function(self, actor)
                if(jumping == false) then
                        self.x = actor.x
                        self.y = actor.y
                end
                
                if(the.keys:pressed(triggerKey) and jumping == false) then
                        jumping = true
                        
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
                self.y = acceleration+self.y
                
                return self.y
        end
}

MovingActor = {

}

ShotingActor = {
        -- definir que tipo de disparo se hará
        -- angulo en el que realizar el disparo
        -- 
}

