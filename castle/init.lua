-- Nivel 1: castillo

require 'castle/thwomp'
require 'castle/background'
require 'castle/turtle'
require 'castle/floor'
require 'castle/lava_burst'

CastleLevel = Level:extend
{
    width = 12800,
    
    mapFile = 'global/assets/graphics/mapa/mapa32x32.lua',
    
    players = {
        main_player = Fario:new
        {
            x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2,
            
            acceleration = { x = 0, y = 600, rotation = 0 }
        }
    },
    
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
            image = 'global/assets/graphics/mapa/lavagreen.png',
            translateScale = 1
        }
    },

    onCustomNew = function(self)
        self.timer:start{ delay = 1, func = self.startLevel, arg = { self } }
    end,
    
    onLevelComplete = function(self)
        self.active = false
    end,
    
    startLevel = function(self)
        self.start_level = true
    end
}