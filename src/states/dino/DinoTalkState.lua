--[[
    Animal Puzzle Game
    
    Author: Ruben Sarabia Riquelme
]]

DinoTalkState = Class{__includes = BaseState}

function DinoTalkState:init(dino)
    self.dino = dino
    self.dino.texture = gTextures['dino']['talking']
end

function DinoTalkState:enter(params)
    self.speechBubble = SpeechBubble({
        language = self.dino.language,
        text = params.text,
        index = params.index,
        font = params.font,
        x = self.dino.x - 130,
        y = self.dino.y - 50
    })

    gSpeech[self.dino.language][params.text][params.index]:play()
end

function DinoTalkState:render()
    love.graphics.draw(self.dino.texture, self.dino.x, self.dino.y, self.dino.rotation, self.dino.scale)

    self.speechBubble:render()
end