ActorAnimation = Animation:extend
{
	sequencePool = {},
	
	activeSequenceName = nil,
	
	switchSequence = function(self, name)
		if self.sequences and self.sequencePool[name] then
			self.sequences = self.sequencePool[name]
			self.image = self.sequencePool[name].image
			self.activeSequenceName = name
		end
	end,
	
	activeSequence = function(self, name)
		if self.activeSequenceName == name then return true else return false end
	end
}