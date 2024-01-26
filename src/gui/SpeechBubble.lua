--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

SpeechBubble = Class{}

function SpeechBubble:init(def)
    -- parameters needed to select the appropiate text
    self.text = gTexts[def.language][def.text][def.index]
    self.font = def.font

    self.x = def.x
    self.y = def.y
    self.scale = def.scale or 0.75 

    -- parameters to print rotated text to speech bubble
    self.rotation = def.rotation or 5.8
    self.textx = def.textx or 600
    self.texty = def.texty or 900

    self.textBox = TextBox({
        x = self.textx,
        y = self.texty,
        width = 160,
        height = 100,
        rotation = self.rotation,
        text = self.text,
        font = self.font
    })
end

function SpeechBubble:render()
    love.graphics.draw(gTextures['dino']['speech-bubble'], self.x, self.y, 0, self.scale)
    
    self.textBox:render()
end
