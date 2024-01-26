--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme

    I made this game for my toddler to play and learn animal names and sounds in the three different
    languages that are spoken at home. It also served me to learn and practice programming in Lua and Love2D.

    Animal sprites:

    ryan.dansie - https://opengameart.org/content/round-animals

    Backgrounds by brgfx on Freepik
    https://www.freepik.com/free-vector/four-different-nature-horizontal-scene_16853534.htm#from_view=detail_alsolike

    Animal sound effects from Pixabay

    GUI elements by Yuliya Pauliukevich https://www.vecteezy.com/free-vector/wood-button
]]

require 'src/Dependencies'

function love.load()
    love.window.setTitle('Animal Puzzle Game')
    math.randomseed(os.time()) -- not sure if I am going to use random in this project but I leave this here for now
    local windowWidth, windowHeight = love.graphics.getDimensions()
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, windowWidth, windowHeight, {
        fullscreen = true,
        vsync = true,
        resizable = true
    })

    love.mouse.setVisible(false)

    gStateStack = StateStack()
    gStateStack:push(LanguageSelectionState())
    --gStateStack:push(VictoryState())

    -- empty tables that will be filled with keys we pressed each frame
    -- this will allows us to use user input in other parts of our code
    love.keyboard.keysPressed = {}
    love.mouse.keysPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end

function love.mousepressed(x, y, key)
    love.mouse.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.mouse.wasPressed(key)
    return love.mouse.keysPressed[key]
end

function love.update(dt)
    Timer.update(dt)
    gStateStack:update(dt)

    love.keyboard.keysPressed = {}
    love.mouse.keysPressed = {}
end

function love.draw()
    local x, y = push:toGame(love.mouse.getPosition())
    push:start()
    gStateStack:render()
    love.graphics.draw(gTextures['gui']['cursor'], x, y, 0, 0.2)
    push:finish()
end




