--[[
    Animal Puzzle Game
]]

DinoLaughState = Class{__includes = BaseState}

function DinoLaughState:init(dino)
    self.dino = dino
    self.dino.texture = gTextures['dino']['talking']
end

function DinoLaughState:enter(params)
    gSpeech['laugh'][1]:play()
end

function DinoLaughState:render()
    love.graphics.draw(self.dino.texture, self.dino.x, self.dino.y, self.dino.rotation, self.dino.scale)
end