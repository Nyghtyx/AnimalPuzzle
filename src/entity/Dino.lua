--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
    
    Class for the dino assistant that will guide the kid through the game
]]

Dino = Class{}

function Dino:init(def)
    self.stage = def.stage
    self.language = def.language

    -- position on screen
    self.x = def.x
    self.y = def.y

    -- transforms for drawing
    self.scale = def.scale or 1
    self.rotation = def.rotation or 0

    self.texture = gTextures['dino']['standing']

    self.stateMachine = StateMachine {
        ['stand'] = function() return DinoStandState(self) end,
        ['talk'] = function() return DinoTalkState(self) end,
        ['sit'] = function() return DinoSitState(self) end,
        ['laugh'] = function() return DinoLaughState(self) end,
    }
end

function Dino:changeState(name, params)
    self.stateMachine:change(name, params)
end

function Dino:checkClick(x, y)
    return self.x + 50 < x and self.x +50 + 100  > x and self.y + 50 < y and self.y + 50 + 150 > y
end


function Dino:laugh()
    self:changeState('laugh')
    Timer.after(1.5, function()
        self:changeState('sit')
    end)
end

function Dino:render()
    self.stateMachine:render()
    --draw hitbox
    --love.graphics.rectangle('fill', self.x + 50, self.y + 50, 100, 150)
end
