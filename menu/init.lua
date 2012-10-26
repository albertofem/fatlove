-- Punto de entrada de la View del Menu

StartButton = Button:extend
{
        x = 300,
        y = 300,
        
        background = Tile:extend
        {
                x = 0,
                y = 0,
                
                width = 223,
                height = 37,
                
                image = 'menu/assets/graphics/button.png'
        },
        
        onMouseEnter = function(self)
                playSound('menu/assets/sounds/buttonOver.wav')
        end,
        
        onMouseUp = function(self)
                Menu.titleMusic:stop()
                the.app.view = Level1:new()
        end
}

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