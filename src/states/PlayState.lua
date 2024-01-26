--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

PlayState = Class{__includes = BaseState}

function PlayState:init(stage, language, dino)
    -- get the stage that we are going to play
    self.stage = stage

    gSounds['play-music']:setLooping(true)
    gSounds['play-music']:setVolume(0.1)
    gSounds['play-music']:play()

    -- get the language
    self.language = language

    -- flag to check if we are ready to ask a question
    self.questionReady = false

    -- flag to check if game mode is on
    self.gameOn = false

    -- flag to check if we are accepting input
    self.inputPaused = true

    -- create dino assistant
    self.dino = dino
    self.dino:changeState('stand')

    -- generate the animals according to the stage we are playing
    -- here we are instantiating as well another table that will track which animal sounds have been asked already
    self.animals = {}
    self.trackAnimals = {}
    for i, animal in pairs(STAGE_ANIMALS[self.stage]) do
        table.insert(self.animals, Entity(ENTITY_DEFS[animal]))
        table.insert(self.trackAnimals, animal)
    end

    -- generate the first animal that will be asked
    self.currentAnimal = self:getAnimal()

    self.buttons = {}
    self:generateButtons()
end

function PlayState:enter(params)
    Timer.after(0.4, function()
        self:triggerWelcome()
    end)
end

function PlayState:update(dt)
    if self.questionReady and self.gameOn then
        self.questionReady = false
        self:triggerQuestion(self.currentAnimal)
    end

    if love.mouse.wasPressed(1) and not self.inputPaused then
        -- get the position of the mouse
        local x, y = push:toGame(love.mouse.getPosition())
        -- check if is clicking an animal and if it is perform its onClick action
        if self.dino:checkClick(x, y) then
            self.dino:laugh()
        end
        for i, animal in pairs(self.animals) do
            if animal:checkClick(x, y) and animal.canClick then
                if self.gameOn and animal.animal == self.currentAnimal then
                    self:triggerCorrectAnswer(animal)
                else
                    animal:onClick()
                end
            end
        end

        for i, button in pairs(self.buttons) do
            if button:checkClick(x, y) then
                button.onClick()
            end
        end
    end
end

function PlayState:render()
    -- render the appropiate background
    love.graphics.draw(gTextures['backgrounds'][self.stage], 0, 0)

    -- render the animals
    for i, animal in pairs(self.animals) do
        animal:render()
    end

    for i, button in pairs(self.buttons) do
        button:render()
    end

    self.dino:render()
end

function PlayState:exit()
    gSounds['play-music']:stop()
end

function PlayState:generateButtons()
    -- create button to go back to stage selection state
    table.insert(self.buttons, Button({
        x = 10,
        y = 10,
        height = 297,
        width = 326,
        texture = gTextures['gui']['back-button'],
        scale = 0.2,
        onClick = function() gStateStack:pop() gStateStack:push(StageSelectionState(self.language, self.dino)) end
    }))
    -- create button to trigger questions game
    table.insert(self.buttons, Button({
        x = 100,
        y = 10,
        height = 296,
        width = 325,
        texture = gTextures['gui']['question-button'],
        scale = 0.2,
        onClick = function()
            if not self.gameOn then
                self.dino:changeState('talk', {
                    text = 'play',
                    index = 1,
                    font = gFonts['medium']
                })
                Timer.after(1, function() self.dino:changeState('stand') end)
                Timer.after(1.5, function() self.questionReady = true self.gameOn = true end)
            elseif self.gameOn then
                self.questionReady = true
            end
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
        onClick = function() love.event.quit() end
    }))
end

function PlayState:triggerWelcome()
    self.dino:changeState('talk', {
        text = self.stage,
        index = 1,
        font = gFonts['medium']
    })
    Timer.after(1, function() self.dino:changeState('sit') end)
    self.inputPaused = false
end

function PlayState:triggerQuestion(animal)
    self.inputPaused = true
    self.dino:changeState('talk', {
        text = 'question', 
        index = 1,
        font = gFonts['small']
    })
    Timer.after(1, function() 
        self.dino:changeState('sit')
        gSounds[animal]:play()
    end)
    self.inputPaused = false
end

function PlayState:getAnimal()
    return self.trackAnimals[love.math.random(#self.trackAnimals)]
end

function PlayState:checkVictory()
    return #self.trackAnimals < 1 and true or false
end

function PlayState:removeAnimal()
    for i, animal in pairs(self.trackAnimals) do
        if animal == self.currentAnimal then
            table.remove(self.trackAnimals, i)
        end
    end
end

function PlayState:triggerCorrectAnswer(animal)
    self.dino:changeState('talk', {
        text = 'good-job',
        index = 1,
        font = gFonts['medium']
    })
    Timer.after(1, function() 
        self.dino:changeState('stand')
    end)
    Timer.after(1.5, function()
        self.dino:changeState('talk', {
            text = self.currentAnimal,
            index = 1,
            font = gFonts['medium']
        })
    end)
    Timer.after(2.5, function()
        self.dino:changeState('sit')
        animal:onClick()
    end)
    Timer.after(5, function()
        self:removeAnimal()
        if self:checkVictory() then
            self:triggerVictory()
        else
            self.currentAnimal = self:getAnimal()
            self.questionReady = true
        end
    end)
end

function PlayState:triggerVictory()
    self.dino:changeState('talk', {
        text = 'woho',
        index = 1,
        font = gFonts['small']
    })
    Timer.after(0.7, function()
        self.dino:changeState('talk', {
            text = 'woho',
            index = 2,
            font = gFonts['small']
        })
    end)
    Timer.after(2, function()
        for i, animal in pairs(self.animals) do
            animal:onClick()
        end
    end)
    Timer.after(3.5, function()
        gStateStack:push(FadeState({r = 1, g = 1, b = 1}, {starting = 0, ending = 1}, 1.5, 
            function()
                gStateStack:pop()
                gStateStack:pop()
                gStateStack:push(VictoryState(self.dino))
                gStateStack:push(FadeState({r = 1, g = 1, b = 1}, {starting = 1, ending = 0}, 1, 
                    function() gStateStack:pop() end)
                )
            end)
        )
    end)
end


        

    