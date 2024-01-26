--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

FadeState = Class{__includes = BaseState}

function FadeState:init(color, opacity, time, onFadeComplete)
    self.r = color.r
    self.g = color.g
    self.b = color.b
    self.opacity = opacity.starting
    self.endingOpacity = opacity.ending
    self.time = time

    Timer.tween(self.time, {
        [self] = {opacity = self.endingOpacity}
    })
    :finish(function()
        onFadeComplete()
    end)
end

function FadeState:render()
    love.graphics.setColor(self.r, self.g, self.b, self.opacity)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    love.graphics.setColor(1, 1, 1, 1)
end