--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

DinoSitState = Class{__includes = BaseState}

function DinoSitState:init(dino)
    self.dino = dino
    self.dino.texture = gTextures['dino']['sitting']
end

function DinoSitState:render()
    love.graphics.draw(self.dino.texture, self.dino.x, self.dino.y, self.dino.rotation, self.dino.scale)
end