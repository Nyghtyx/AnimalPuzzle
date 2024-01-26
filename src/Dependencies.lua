Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

-- a few global constants, centralized
require 'src/constants'

-- text translated to different languages
require 'src/localization'

require 'src/StateMachine'
require 'src/StateStack'

require 'src/entity/Dino'
require 'src/entity/entity_defs'
require 'src/entity/Entity'

require 'src/gui/Button'
require 'src/gui/SpeechBubble'
require 'src/gui/TextBox'

-- each of the individual states our game can be; each state has
-- its own update and render methods
require 'src/states/BaseState'
require 'src/states/LanguageSelectionState'
require 'src/states/PlayState'
require 'src/states/StageSelectionState'
require 'src/states/FadeState'
require 'src/states/VictoryState'

require 'src/states/dino/DinoStandState'
require 'src/states/dino/DinoTalkState'
require 'src/states/dino/DinoSitState'
require 'src/states/dino/DinoLaughState'

gFonts = {
    ['large'] = love.graphics.newFont('fonts/bubblegum.woff', 30),
    ['medium'] = love.graphics.newFont('fonts/bubblegum.woff', 24),
    ['small'] = love.graphics.newFont('fonts/bubblegum.woff', 18)
}

gTextures = {
    ['farm'] = {
        ['chicken'] = love.graphics.newImage('graphics/farm/chicken.png'),
        ['cow'] = love.graphics.newImage('graphics/farm/cow.png'),
        ['horse'] = love.graphics.newImage('graphics/farm/horse.png'),
        ['pig'] = love.graphics.newImage('graphics/farm/pig.png'),
        ['sheep'] = love.graphics.newImage('graphics/farm/sheep.png')
    },
    ['garden'] = {
        ['cat'] = love.graphics.newImage('graphics/garden/cat.png'),
        ['dog'] = love.graphics.newImage('graphics/garden/dog.png'),
        ['mouse'] = love.graphics.newImage('graphics/garden/mouse.png'),
        ['owl'] = love.graphics.newImage('graphics/garden/owl.png'),
        ['squirrel'] = love.graphics.newImage('graphics/garden/squirrel.png')
    },
    ['savanna'] = {
        ['elephant'] = love.graphics.newImage('graphics/savanna/elephant.png'),
        ['giraffe'] = love.graphics.newImage('graphics/savanna/giraffe.png'),
        ['hippo'] = love.graphics.newImage('graphics/savanna/hippo.png'),
        ['monkey'] = love.graphics.newImage('graphics/savanna/monkey.png'),
        ['zebra'] = love.graphics.newImage('graphics/savanna/zebra.png')
    },
    ['backgrounds'] = {
        ['farm'] = love.graphics.newImage('graphics/backgrounds/farm.png'),
        ['garden'] = love.graphics.newImage('graphics/backgrounds/garden.png'),
        ['savanna'] = love.graphics.newImage('graphics/backgrounds/savanna.png')
    },
    ['gui'] = {
        ['title'] = love.graphics.newImage('graphics/gui/title.jpg'),
        ['cursor'] = love.graphics.newImage('graphics/gui/cursor.png'),
        ['back-button'] = love.graphics.newImage('graphics/gui/back-button.png'),
        ['quit-button'] = love.graphics.newImage('graphics/gui/quit-button.png'),
        ['question-button'] = love.graphics.newImage('graphics/gui/question-button.png'),
        ['farm-button'] = love.graphics.newImage('graphics/gui/farm-button.png'),
        ['garden-button'] = love.graphics.newImage('graphics/gui/garden-button.png'),
        ['savanna-button'] = love.graphics.newImage('graphics/gui/savanna-button.png'),
        ['wood-panel'] = love.graphics.newImage('graphics/gui/wood-panel.png'),
        ['wood-button'] = love.graphics.newImage('graphics/gui/wood-button.png')
    },
    ['dino'] = {
        ['celebrating'] = love.graphics.newImage('graphics/dino/dino-celebrating.png'),
        ['sitting'] = love.graphics.newImage('graphics/dino/dino-sitting.png'),
        ['standing'] = love.graphics.newImage('graphics/dino/dino-standing.png'),
        ['talking'] = love.graphics.newImage('graphics/dino/dino-talking.png'),
        ['speech-bubble'] = love.graphics.newImage('graphics/dino/round-bubble.png')
    },
    ['confetti'] = love.graphics.newImage('graphics/celebration/confetti-final.png')
}

gSounds = {
    ['menu'] = love.audio.newSource('sounds/music/menu.mp3', 'static'),
    ['play-music'] = love.audio.newSource('sounds/music/play-music.mp3', 'static'),
    ['cat'] = love.audio.newSource('sounds/cat.wav', 'static'),
    ['chicken'] = love.audio.newSource('sounds/chicken.mp3', 'static'),
    ['cow'] = love.audio.newSource('sounds/cow.wav', 'static'),
    ['dog'] = love.audio.newSource('sounds/dog.mp3', 'static'),
    ['elephant'] = love.audio.newSource('sounds/elephant.mp3', 'static'),
    ['giraffe'] = love.audio.newSource('sounds/giraffe.mp3', 'static'),
    ['hippo'] = love.audio.newSource('sounds/hippo.wav', 'static'),
    ['horse'] = love.audio.newSource('sounds/horse.wav', 'static'),
    ['monkey'] = love.audio.newSource('sounds/monkey.mp3', 'static'),
    ['mouse'] = love.audio.newSource('sounds/mouse.mp3', 'static'),
    ['owl'] = love.audio.newSource('sounds/owl.mp3', 'static'),
    ['pig'] = love.audio.newSource('sounds/pig.mp3', 'static'),
    ['sheep'] = love.audio.newSource('sounds/sheep.mp3', 'static'),
    ['squirrel'] = love.audio.newSource('sounds/squirrel.wav', 'static'),
    ['zebra'] = love.audio.newSource('sounds/zebra.wav', 'static'),
    ['cheering'] = love.audio.newSource('sounds/cheering.mp3', 'static')
}