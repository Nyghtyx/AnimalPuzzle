--[[
    Animal Puzzle Game

    -- BaseState Class --

    Author: Ruben Sarabia

    Used as the base class for all of our states, so we do not have to
    define empty methods in each of them.
]]

BaseState = Class{}

function BaseState:init() end
function BaseState:enter() end
function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end