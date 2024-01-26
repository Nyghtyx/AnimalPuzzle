--[[
    Animal Puzzle Game

    Author: Ruben Sarabia Riquelme
]]

Entity = Class{}

function Entity:init(def)
    self.stage = def.stage
    self.animal = def.animal
    
    -- position in the map
    self.x = def.x
    self.y = def.y

    -- transforms for drawing
    self.scale = def.scale
    self.rotation = def.rotation

    -- actual scaled dimensions in the map
    self.width = self.scale * def.width
    self.height = self.scale * def.height

    -- flag that controls if the animal can be clicked
    self.canClick = true
end

-- check if entity is clicked (it basically uses AABB collision detection with only one point)
function Entity:checkClick(x, y)
    return self.x < x and self.x + self.width > x and self.y < y and self.y + self.height > y
end

-- called when interacting with this entity by clicking
function Entity:onClick()
    -- stop temporarily accepting more clicks
    self.canClick = false
    gSounds[self.animal]:play()
    local duration = gSounds[self.animal]:getDuration()
    Timer.every(0.4, function() 
        Timer.tween(0.2, {
            [self] = {scale = self.scale * 1.1,
                x = self.x - 5,
                y = self.y - 5,
            }
        }):finish(function()
            Timer.tween(0.2, {
                [self] = {scale = self.scale / 1.1,
                    x = self.x + 5,
                    y = self.y + 5,
                }
            })
        end)
    end)
    :limit(3)
    -- accept clicks again
    :finish(function() self.canClick = true end)
end

function Entity:render()
    love.graphics.draw(gTextures[self.stage][self.animal], self.x, self.y, self.rotation, self.scale)
end

