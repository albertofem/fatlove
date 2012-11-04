require 'global/actor/heartbullet'

Princess = ActorAnimation:extend
{
	width = 200,
	height = 335,
	
	x = -200,
	y = 280,
	
	shooting = ShootingActor:new(),
	
	bullet = HeartBullet:extend
	{
		image = 'global/assets/graphics/princesa/heart.png',
		speed = { x = 40, y = 0 },
		initialPosition = { x = 75, y = 120 },
		collisionMap = {},
	},
	
	sequencePool = {
		walking = 
		{
			image = 'global/assets/graphics/princesa/run.png',
			
			walking = { frames = { 1, 2, 3, 4 }, fps = 25 },
		},
		
		attacking =
		{
			image = 'global/assets/graphics/princesa/attack.png',
			
			attack = { frames = { 1, 2, 3, 4, 5 }, fps = 5 },
		},
	},
	
	readyToShoot = true,
	
	onShow = function(self)
		self.velocity.x = 50
	end,
		
	onNew = function(self)
		self:switchSequence('walking')
		self:play('walking')
		
		self.shooting.bullet = self.bullet
		self.shooting.bullet.collisionMap['fario'] = the.player.fario
	end,
	
	onStop = function(self)
		self.velocity.x = 0
		self:freeze()
		
		self.sequencePool.walking.walking.fps = 2
	end,
	
	onUpdate = function(self)	
		if(self.currentName == 'attack') then
			if self.currentFrame == 3 and self.readyToShoot then
				self.shooting:shoot(self)
				self.readyToShoot = false
			elseif self.currentFrame == 4 then
				self.readyToShoot = true
			end
		end
	end,
	
	onEndSequence = function(self, name)
		if(name == 'attack') then
			self:switchSequence('walking')
			self:play('walking')
		end
	end,
	
	createAttackTimer = function(self)
		the.view.timer:start{ delay = 3, func = self.onAttack, arg = { self } }
	end,
	
	onLevelStart = function(self)
		self.velocity.x = 315
		self:createAttackTimer()
		
		self:play('walking')
	end,
	
	onAttack = function(self)
		self:switchSequence('attacking')
		self:play('attack')
		
		self:createAttackTimer()
	end
}