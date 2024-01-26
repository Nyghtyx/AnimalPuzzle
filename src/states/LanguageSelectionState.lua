--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

LanguageSelectionState = Class{__includes = BaseState}

function LanguageSelectionState:init()
    gSounds['menu']:setLooping(true)
    gSounds['menu']:setVolume(0.2)
    gSounds['menu']:play() 

    -- create dino assistant
    self.dino = Dino({
        stage = 'language',
        language = LANGUAGES[love.math.random(#LANGUAGES)], -- choose a random language for language selection stage
        x = 1000,
        y = 800, -- start outside screen and slide in
    })

    self.dino:changeState('stand')

    self.buttons = {}
    self:generateButtons()
end

function LanguageSelectionState:enter(params)
    self:triggerWelcome()
end

function LanguageSelectionState:update(dt)
    if love.mouse.wasPressed(1) then
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

function LanguageSelectionState:render()
    -- render title image
    love.graphics.setColor(0, 108/255, 111/255, 1)
    love.graphics.rectangle('fill', 0, 0, 1280, 720)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gTextures['gui']['title'], (VIRTUAL_WIDTH - 409) / 2, 0)

    -- render menu panel
    love.graphics.draw(gTextures['gui']['wood-panel'], (VIRTUAL_WIDTH - 217 * 1.15) / 2, 420, 0, 1.2)

    -- render stage buttons
    for i, button in pairs(self.buttons) do
        button:render()
    end

    self.dino:render()
end

function LanguageSelectionState:generateButtons()
    -- create a button to close the game
    table.insert(self.buttons, Button({
        x = 1205,
        y = 10,
        height = 297,
        width = 325,
        texture = gTextures['gui']['quit-button'],
        scale = 0.2,
        onClick = function() love.event.quit() end
    }))

    -- create language buttons
    table.insert(self.buttons, Button({
        x = (VIRTUAL_WIDTH - 137) / 2,
        y = 465,
        height = 52,
        width = 137,
        scale = 1.1,
        hasText = true,
        text = 'English',
        font = gFonts['medium'],
        texture = gTextures['gui']['wood-button'],
        onClick = function()
            love.audio.stop() 
            gStateStack:pop() 
            gStateStack:push(StageSelectionState('english', self.dino)) 
        end
    }))
    table.insert(self.buttons, Button({
        x = (VIRTUAL_WIDTH - 137) / 2,
        y = 535,
        height = 52,
        width = 137,
        scale = 1.1,
        hasText = true,
        text = 'Español',
        font = gFonts['medium'],
        texture = gTextures['gui']['wood-button'],
        onClick = function()
            love.audio.stop() 
            gStateStack:pop() 
            gStateStack:push(StageSelectionState('spanish', self.dino)) 
        end
    }))
    table.insert(self.buttons, Button({
        x = (VIRTUAL_WIDTH - 137) / 2,
        y = 605,
        height = 52,
        width = 137,
        scale = 1.1,
        hasText = true,
        text = 'Português',
        font = gFonts['medium'],
        texture = gTextures['gui']['wood-button'],
        onClick = function()
            love.audio.stop() 
            gStateStack:pop() 
            gStateStack:push(StageSelectionState('portuguese', self.dino)) 
        end
    }))
end

function LanguageSelectionState:triggerWelcome()
    Timer.tween(0.5, {
        [self.dino] = {y = 500}
    })
    :finish(function()
        self.dino:changeState('talk', {
            text = 'welcome', 
            index = math.random(2),
            font = gFonts['medium']
        })
    end)
end

