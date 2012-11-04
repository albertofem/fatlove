-- Generic level

Level = View:extend
{
	backgrounds = {},
	
	players = {},
	
	enemies = {},
	
	emitters = {},
	
	scroll_speed = 25,
	
	start_level = false,
	
	started = false,
	
	level_duration = 120,
	
	camera = Sprite:new
	{
		width = 1,
		height = 1,
		
		visible = false,
		
		acceleration = { x = 3000, y = 0, rotation = 0 },
		
		onNew = function(self)
			self.x = love.graphics.getWidth() / 2
			self.y = love.graphics.getHeight() / 2
		end
	},
	
	onNew = function(self)
		-- Custom initializator
		if self.onCustomNew then
			self:onCustomNew()
		end
		
		-- Add background layers
		for index, background in pairs(self.backgrounds) do
			local layer = Group:new()
			layer.translateScale.x = background.translateScale
			layer.translateScale.y = background.translateScale
			
			for x = 0, self.width / background.width do
				x = background.width * x
				local tile = Tile:new{ x = x, y = background.y, image = background.image }
				layer:add(tile)
			end
			
			self:add(layer)
		end	
		
		-- Add map if any
		if self.mapFile then
			self:loadLayers(self.mapFile)
		end	
		
		-- Add players
		for index, player in pairs(self.players) do
			self:add(player)
		end
		
		-- Add enemies
		for index, enemy in pairs(self.enemies) do
			self:add(enemy)
			
			if enemy.triggerBox then
				self:add(enemy.triggerBox)
			end
		end
		
		-- Add emitters
		for index, emitter in pairs(self.emitters) do
			self:add(emitter)
		end
		
		-- Add camera
		self:add(self.camera)
	end,

	onUpdate = function(self)
		-- Update players
		for index, player in pairs(self.players) do
			self.map:subcollide(player)
			self.map:subdisplace(player)
			player:onUpdate()
		end
		
		-- Do the rest with enemies and entities and shit
		if self.start_level and self.started == false then
			self:panTo(self.camera, self.level_duration, self.onLevelComplete, 'linear')
			self.started = true
		end
		
		-- Custom updates
		if self.onCustomUpdate then
			self:onCustomUpdate()
		end
	end,
	
	addPlayer = function(self, player)
		table.insert(self.players, player)
	end,
	
	addEnemy = function(self, enemy)
		table.insert(self.enemies, enemy)
	end,
	
	addEmitter = function(self, emitter)
		table.insert(self.emitters, emitter)
	end
}