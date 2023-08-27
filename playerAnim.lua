Animation = {}

function Animation:load()
    anim8 = require 'libraries/anim8/anim8'

    Sprites = {}
    Sprites.playerSheet = love.graphics.newImage('sprites/PlayerAnimations.png')

    local grid = anim8.newGrid(44, 40, Sprites.playerSheet:getWidth(), Sprites.playerSheet:getHeight())

    Animation.idle = anim8.newAnimation(grid('1-6', 1), 0.1)
end

function Animation:update(dt)
    Animation.idle:update(dt)
end

function Animation:draw()
    Animation.idle:draw(Sprites.playerSheet, 0, 0)
end