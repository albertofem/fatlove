-- Loading page

LoadingLogo = Tile:extend
{
        image = 'loading/assets/graphics/loading.gif',
        
        width = 316,
        height = 316,

        onNew = function(self)
                self.x = (the.app.width / 50) - (self.width/50)
                self.y = (the.app.height / 50) - (self.height/50)
        end
}

Loading = View:extend
{
        onNew = function(self)
                self:add(LoadingLogo:new())
        end,
        
        onRun = function(self)
                -- load assets
                sound('menu/assets/music/title.mp3', 'large')
        end
}