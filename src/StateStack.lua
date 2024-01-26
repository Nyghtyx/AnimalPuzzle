--[[
    Animal Puzzle Game

    -- State Stack --

    Author: Ruben Sarabia Riquelme

    A state stack that will allow us to push or pop states at will to control the gameplay
]]

StateStack = Class{}

function StateStack:init()
    self.states = {}
end

function StateStack:update(dt)
    -- update only the last state of the stack
    self.states[#self.states]:update(dt)
end

function StateStack:render()
    -- render all states starting from the bottom of the stack
    for i, state in pairs(self.states) do
        state:render()
    end
end

function StateStack:clear()
    self.states = {}
end

function StateStack:push(state)
    -- insert a state on top of the stack
    table.insert(self.states, state)
    state:enter()
end

function StateStack:pop()
    -- exit from the state on the top of the stack and pop it
    self.states[#self.states]:exit()
    table.remove(self.states)
end