Actor = Sprite:extend
{
	tile = nil,

	animation = nil,

	currentResource = nil,

	onNew = function(self)
		--assert(not self.tile == nil and not self.animation == nil, "You can't have both animation and tile resources in the same actor instance")

		if self.tile then
			self.currentResource = self.tile
		elseif self.animation then 
			self.currentResource = self.animation
		else
			assert(not self.tile and not self.animation, "You can't have an actor without any resource")
		end
	end,

	draw = function(self)
		self.currentResource:draw()
	end
}