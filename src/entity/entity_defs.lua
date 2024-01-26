--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme

    Trying to implement some data driven design despite this project being relatively small
]]

ENTITY_DEFS = {
    ['chicken'] = {
        stage = 'farm',
        animal = 'chicken',
        x = 242,
        y = 127,
        rotation = 0,
        scale = 0.3,
        height = 299,
        width = 240
    },
    ['cow'] = {
        stage = 'farm',
        animal = 'cow',
        x = 640,
        y = 460,
        rotation = 0,
        scale = 0.5,
        height = 299,
        width = 264
    },
    ['horse'] = {
        stage = 'farm',
        animal = 'horse',
        x = 100,
        y = 400,
        rotation = 0,
        scale = 0.3,
        height = 594,
        width = 510
    },
    ['pig'] = {
        stage = 'farm',
        animal = 'pig',
        x = 900,
        y = 400,
        rotation = 0,
        scale = 0.3,
        height = 300,
        width = 285
    },
    ['sheep'] = {
        stage = 'farm',
        animal = 'sheep',
        x = 370,
        y = 540,
        rotation = 0,
        scale = 0.4,
        height = 300,
        width = 288
    },
    ['cat'] = {
        stage = 'garden',
        animal = 'cat',
        x = 420,
        y = 450,
        rotation = 0,
        scale = 0.5,
        height = 297,
        width = 189
    },
    ['dog'] = {
        stage = 'garden',
        animal = 'dog',
        x = 760,
        y = 520,
        rotation = 0,
        scale = 0.5,
        height = 298,
        width = 222
    },
    ['mouse'] = {
        stage = 'garden',
        animal = 'mouse',
        x = 150,
        y = 530,
        rotation = 0,
        scale = 0.35,
        height = 296,
        width = 300
    },
    ['owl'] = {
        stage = 'garden',
        animal = 'owl',
        x = 60,
        y = 160,
        rotation = 0,
        scale = 0.35,
        height = 293,
        width = 300
    },
    ['squirrel'] = {
        stage = 'garden',
        animal = 'squirrel',
        x = 1060,
        y = 80,
        rotation = 0,
        scale = 0.4,
        height = 299,
        width = 225
    },
    ['elephant'] = {
        stage = 'savanna',
        animal = 'elephant',
        x = 640,
        y = 400,
        rotation = 0,
        scale = 0.7,
        height = 286,
        width = 300
    },
    ['giraffe'] = {
        stage = 'savanna',
        animal = 'giraffe',
        x = 440,
        y = 160,
        rotation = 0,
        scale = 0.9,
        height = 298,
        width = 159
    },
    ['hippo'] = {
        stage = 'savanna',
        animal = 'hippo',
        x = 300,
        y = 550,
        rotation = 0,
        scale = 0.5,
        height = 300,
        width = 243
    },
    ['monkey'] = {
        stage = 'savanna',
        animal = 'monkey',
        x = 60,
        y = 160,
        rotation = 0,
        scale = 0.4,
        height = 243,
        width = 297
    },
    ['zebra'] = {
        stage = 'savanna',
        animal = 'zebra',
        x = 800,
        y = 230,
        rotation = 0,
        scale = 0.4,
        height = 300,
        width = 252
    }
}