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
	
	level_duration = 10,
	
	camera = Sprite:new
	{
		width = 1,
		height = 1,
		
		visible = false,
		
		acceleration = { x = -5000, y = 0, rotation = 0 },
		
		onNew = function(self)
			self.x = love.graphics.getWidth() / 2
			self.y = love.graphics.getHeight() / 2
		end
	},
	
	onNew = function(self)
		-- Add map if any
		if self.map then
			self:add(self.map)
		end
		
		-- Add players
		for index, player in pairs(self.players) do
			assert(player.main_resource, 'Player must have a main resource')
			self:add(player.main_resource)
		end
		
		-- Add enemies
		for index, enemy in pairs(self.enemies) do
			assert(player.main_resource, 'Enemy must have a main resource')
			self:add(enemy.main_resource)
		end
		
		-- Add camera
		self:add(self.camera)
		
		if self.onCustomNew then
			self:onCustomNew()
		end
	end,

	onUpdate = function(self)
		for index, player in pairs(self.players) do
			player:onUpdate()
		end
		
		if self.onCustomUpdate then
			self:onCustomUpdate()
		end
		
		-- Do the rest with enemies and entities and shit
		if self.start_level and self.started == false then
			self:panTo(self.camera, self.level_duration)
			self.started = true
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