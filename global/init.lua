-- Include everything in it's right order

require 'global/level'
require 'global/actor'
require 'global/player'
require 'global/enemy'

ScoreBoard = Class:extend
{
    points = 0,
    
    addPoints = function(self, points)
        self.points = self.points+points
    end
}

the.scoreboard = ScoreBoard:new()