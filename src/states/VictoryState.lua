--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

VictoryState = Class{__includes = BaseState}

function VictoryState:init(dino)
    -- this dino is just to pass as reference when we go out of victory state
    self.dino = dino
    self.xScale = 1
    self.xOffset = 0
    self.width = 225
    self.dinoY = (VIRTUAL_HEIGHT - 225) / 2
    self.dinoDY = 0
    -- small gravity sim just to make the dino jump
    self.gravity = 6

    self.confettiY = -1441

    gSounds['cheering']:play()
end

function VictoryState:enter()
    Timer.every(0.7, function()
        self.xScale = - self.xScale
        self.xOffset = self.xOffset + self.width
        self.width = - self.width
    end)

    Timer.after(10, function()
        gStateStack:push(FadeState({r = 0, g = 0, b = 0}, {starting = 0, ending = 1}, 1.5,
            function()
                gSounds['cheering']:stop()
                gStateStack:pop()
                gStateStack:pop()
                gStateStack:push(StageSelectionState(self.dino.language, self.dino))
                gStateStack:push(FadeState({r = 0, g = 0, b = 0}, {starting = 1, ending = 0}, 1,
                    function()
                        gStateStack:pop()                 
                    end)
                )
            end)
        )
    end)
end
function VictoryState:update(dt)
    self.confettiY = self.confettiY + 100 * dt

    if self.dinoY > (VIRTUAL_HEIGHT - 225) / 2 then
        self.dinoY = (VIRTUAL_HEIGHT - 225) / 2
        self.dinoDY = -2
    end

    self.dinoDY = self.dinoDY + self.gravity * dt
    self.dinoY = self.dinoY + self.dinoDY
end

function VictoryState:render()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setColor(238/255, 215/255, 96/255, 1)
    love.graphics.ellipse('fill', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 - 30, 150, 180)
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.draw(gTextures['dino']['celebrating'], (VIRTUAL_WIDTH - 215) / 2, self.dinoY, 0, self.xScale, 1, self.xOffset, 0)

    love.graphics.draw(gTextures['confetti'], 0, self.confettiY)
end