STRICT = true
DEBUG = true

require 'zoetrope'
require 'global'
require 'menu'
require 'global/player'

the.app = App:new
{
        view = Menu:new(),
    
        name = "GameJamUA", -- Cambiar cuando sepamos nombre
        
        onNew = function(self)
                if arg[#arg] == "-debug" then require("mobdebug").start() end
        end,
        
        onRun = function (self)
                self.cursor = Cursor:new()
                self.view = Menu:new()
        end,
        
        onUpdate = function(self)
                self.cursor:onUpdate()
            
                if the.keys:justPressed('escape') == true then
                        if(self.view:instanceOf(Subview)) then
                            self.view:deactivate()
                        else
                            love.event.push('quit')
                        end
                end
        end,
        
        onDraw = function(self)
            self.cursor:draw()
        end
}