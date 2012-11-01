STRICT = true
DEBUG = true

require 'zoetrope'
require 'global'
require 'menu'
require 'global/actor'
require 'global/player'
require 'global/enemy'

the.app = App:new
{
    view = Menu:new(),

    name = "GameJamUA", -- Cambiar cuando sepamos nombre
    
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