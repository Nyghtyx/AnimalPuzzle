--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

Button = Class{}

function Button:init(def)
    self.x = def.x
    self.y = def.y

    self.height = def.height
    self.width = def.width

    self.texture = def.texture

    self.scale = def.scale or 1
    self.rotation = def.rotation or 0
    self.border = def.border or false

    -- font to use
    self.font = def.font or gFonts['large']

    -- if the button has a title
    self.hasTitle = def.hasTitle or false
    self.title = def.title
    if self.hasTitle then
        self.titleWidth = self.font:getWidth(self.title)
        self.titleHeight = self.font:getHeight()
    end

    -- if the button has text
    self.hasText = def.hasText or false
    self.text = def.text
    if self.hasText then
        self.textWidth = self.font:getWidth(self.text)
        self.textHeight = self.font:getHeight()
    end

    -- empty function to be defined
    self.onClick = def.onClick or function() end
end

function Button:checkClick(x, y)
    return self.x < x and self.x + self.width * self.scale > x and self.y < y and self.y + self.height * self.scale > y
end

function Button:render()
    love.graphics.draw(self.texture, self.x, self.y, self.rotation, self.scale)
    
    if self.border then
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle('line', self.x, self.y, self.width * self.scale, self.height * self.scale)
        love.graphics.setColor(1, 1, 1, 1)
    end 

    if self.hasTitle then
        love.graphics.setFont(self.font)
        love.graphics.print(self.title, self.x + (self.width * self.scale - self.titleWidth) / 2, self.y - self.titleHeight - 10)
    end

    if self.hasText then
        love.graphics.setFont(self.font)
        love.graphics.print(self.text, self.x + (self.width * self.scale - self.textWidth) / 2, self.y + (self.height * self.scale - self.textHeight) / 2)
    end
end