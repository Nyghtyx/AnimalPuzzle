--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

DinoStandState = Class{__includes = BaseState}

function DinoStandState:init(dino)
    self.dino = dino
    self.dino.texture = gTextures['dino']['standing']
end

function DinoStandState:render()
    love.graphics.draw(self.dino.texture, self.dino.x, self.dino.y, self.dino.rotation, self.dino.scale)
end