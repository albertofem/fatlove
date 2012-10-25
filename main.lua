STRICT = true
DEBUG = true

require 'zoetrope'

MyGame = App:new
{
        ame = "GameJamUA", -- Cambiar cuando sepamos nombre
        
        onNew = function()
                if arg[#arg] == "-debug" then require("mobdebug").start() end
        end,
        
        onRun = function (self)
                self.view = Menu:new()
        end
}
