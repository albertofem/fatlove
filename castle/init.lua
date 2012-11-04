-- Nivel 1: castillo

require 'castle/thwomp'
require 'castle/background'
require 'castle/turtle'
require 'castle/floor'
require 'castle/lava_burst'
require 'global/level/powerup'
require 'global/actor/princess'

CastleLevel = Level:extend
{
    width = 51200,
    
    mapFile = 'global/assets/graphics/mapa/mapa32x32.lua',
    
    players = {
        main_player = Fario:new
        {
            x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2,
            
            acceleration = { x = 0, y = 600, rotation = 0 }
        }
    },
    
    life_full = Tile:extend
    {
        image = 'global/assets/graphics/princesa/life_full.png'
    },
    
    life_empty = Tile:extend
    {
        image = 'global/assets/graphics/princesa/life_empty.png'
    },
    
    princess = Princess:new(),
    
    backgrounds = {
        Background:new
        {
            image = 'global/assets/graphics/mapa/background02.png',
            translateScale = 0.35
        },
        Background:new
        {
            width = 1200,
            image = 'global/assets/graphics/mapa/Fdfario.png',
            translateScale = 0.65
        },
        Background:new
        {
            width = 800,
            image = 'global/assets/graphics/mapa/columna01.png',
            translateScale = 0.90
        },
        Background:new
        {
            image = 'global/assets/graphics/mapa/chocolate.png',
            translateScale = 1
        }
    },

    onCustomNew = function(self)
		love.mouse.setVisible(false)
        
        self.timer:start{ delay = 1, func = self.showPrincess, arg = { self } }
        self.timer:start{ delay = 6, func = self.startLevel, arg = { self } }
    end,
    
    showPrincess = function(self)
        self:add(self.princess)
        self.princess:onShow()
        
        self.timer:start{ delay = 3, func = self.princess.onStop, arg = { self.princess } }
    end,
    
    onLevelComplete = function(self)
        self.active = false
    end,
    
    startLevel = function(self)
        self.start_level = true
        the.timeLimit:startUpdate()
        
        self.princess:onLevelStart()
        
        -- Music!
        local music = love.audio.newSource("global/assets/music/level.wav")
        
        music:setLooping(true)
        
        love.audio.play(music)
    end
}