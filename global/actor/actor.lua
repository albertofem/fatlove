-- Clase genérica actor

Actor = Sprite:extend
{
    actions = {},
    
    invincible = false,
    
    main_resource = nil,
    
    hit_points = 100,
    
    acceleration = { x = 0, y = 300, rotation = 0 },
    
    onUpdate = function(self)
        for index, action in pairs(self.actions) do
            if action.onUpdate then action:onUpdate(self.main_resource) end
        end
    end,
    
    addAction = function(self, action)
        table.insert(self.actions, action)
    end
}