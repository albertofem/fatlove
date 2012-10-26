-- Punto de entrada de la View del Menu

BASE_PATH = lfs.currentdir()

require 'menu/buttons'

Menu = View:extend
{
        titleMusic = love.audio.newSource('menu/assets/music/title.mp3'),

        onNew = function(self)
                self:loadAssets()
        
                self.buttonStart = StartButton:new()
                self:add(self.buttonStart)
        end,
        
        loadAssets = function(self)
                self.titleMusic:setVolume(0.3)
                self.titleMusic:play()    
        end
}