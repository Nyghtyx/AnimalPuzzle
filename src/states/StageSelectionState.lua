--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

StageSelectionState = Class{__includes = BaseState}

function StageSelectionState:init(language, dino)
    gSounds['menu']:play()

    -- get the language to play
    self.language = language

    -- flag to check if we are accepting input
    self.inputPaused = true

    -- create dino assistant
    self.dino = dino
    self.dino.language = self.language
    self.dino:changeState('sit')

    -- create one button per each stage
    self.buttons = {}
    self:generateButtons()

end

function StageSelectionState:enter(params)
    Timer.after(0.3, function()
        self:triggerQuestion()
    end)
end

function StageSelectionState:update(dt)
    if love.mouse.wasPressed(1) and not self.inputPaused then
        local x, y = push:toGame(love.mouse.getPosition())
        if self.dino:checkClick(x, y) then
            self.dino:laugh()
        end
        for i, button in pairs(self.buttons) do
            if button:checkClick(x, y) then
                button.onClick()
            end
        end
    end
end

function StageSelectionState:render()
    -- render title image
    love.graphics.setColor(0, 108/255, 111/255, 1)
    love.graphics.rectangle('fill', 0, 0, 1280, 720)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gTextures['gui']['title'], (VIRTUAL_WIDTH - 409) / 2, 0)

    -- render stage buttons
    for i, button in pairs(self.buttons) do
        button:render()
    end

    self.dino:render()
end

function StageSelectionState:exit()
    gSounds['menu']:stop()
end

function StageSelectionState:generateButtons()
    table.insert(self.buttons, Button({
        x = 68,
        y = 200,
        height = 167,
        width = 300,
        border = true,
        hasTitle = true,
        title = gTexts[self.language]['farm'][1],
        texture = gTextures['gui']['farm-button'],
        onClick = function()
            gStateStack:pop()
            gStateStack:push(PlayState('farm', self.language, self.dino)) 
        end
    }))

    table.insert(self.buttons, Button({
        x = 912,
        y = 200,
        height = 169,
        width = 300,
        border = true,
        hasTitle = true,
        title = gTexts[self.language]['garden'][1],
        texture = gTextures['gui']['garden-button'],
        onClick = function()
            gStateStack:pop() 
            gStateStack:push(PlayState('garden', self.language, self.dino)) 
        end
    }))

    table.insert(self.buttons, Button({
        x = 490,
        y = 500,
        height = 167,
        width = 300,
        border = true,
        hasTitle = true,
        title = gTexts[self.language]['savanna'][1],
        texture = gTextures['gui']['savanna-button'],
        onClick = function()
            gStateStack:pop()
            gStateStack:push(PlayState('savanna', self.language, self.dino)) 
        end
    }))
    -- create button to go back to language selection stage
    table.insert(self.buttons, Button({
        x = 10,
        y = 10,
        height = 297,
        width = 326,
        texture = gTextures['gui']['back-button'],
        scale = 0.2,
        onClick = function()
            gStateStack:pop() 
            gStateStack:push(LanguageSelectionState()) 
        end
    }))

    -- create a button to close the game
    table.insert(self.buttons, Button({
        x = 1205,
        y = 10,
        height = 297,
        width = 325,
        texture = gTextures['gui']['quit-button'],
        scale = 0.2,
        onClick = function() 
            love.event.quit() 
        end
    }))
end

function StageSelectionState:triggerQuestion()
    self.inputPaused = false
    self.dino:changeState('talk', {
        text = 'stage-selection', 
        index = 1,
        font = gFonts['small']
    })
end

