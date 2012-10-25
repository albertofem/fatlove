Level1 = View:new
{
        onNew = function(self)
                self.player = Fill:new{ x = 0, y = 0, width = 32, height = 48,
                                fill = {0, 0, 255} }
                self:add(self.player)
        end
}