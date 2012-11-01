-- Punto de entrada de la View del Menu

require 'menu/buttons'

Menu = View:extend
{
        titleMusic = love.audio.newSource('menu/assets/music/title.mp3'),

        onNew = function(self)
                self:loadAssets()
        
                self.buttonStart = StartButton:new()
                self:add(self.buttonStart)
                
                self.player = Player:new()
                self:add(self.player)

                self.enemy = Enemy:new()
                self:add(self.enemy)
        end,
        
        loadAssets = function(self)
                self.titleMusic:setVolume(0.3)
                self.titleMusic:play()
        end,
        
        onUpdate = function(self)
           self.buttonStart:collide(self.player)
        end
}