STRICT = true
DEBUG = true

require 'zoetrope'
require 'loading'
require 'menu'
require 'global'

the.app = App:new
{
        name = "GameJamUA", -- Cambiar cuando sepamos nombre
        
        onNew = function(self)
                if arg[#arg] == "-debug" then require("mobdebug").start() end
                
                cursor = love.graphics.newImage("global/assets/graphics/cursor.png")
                love.mouse.setVisible(false)
                love.mouse.setGrab(true)
        end,
        
        onRun = function (self)
                self.view = Menu:new()
        end,
        
        onDraw = function(self)
                love.graphics.draw(cursor, love.mouse.getX() - cursor:getWidth() / 2, love.mouse.getY() - cursor:getHeight() / 2)
        end,
        
        onUpdate = function(self)
                if the.keys:pressed('escape') == true then
                        love.event.push('quit')
                end
        end        
}
