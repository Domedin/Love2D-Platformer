Animation = {}

function Animation:load()
    anim8 = require 'libraries/anim8/anim8'

    Sprites = {}
    Sprites.playerSheet = love.graphics.newImage('sprites/PlayerAnimations.png')

    local grid = anim8.newGrid(77, 70, Sprites.playerSheet:getWidth(), Sprites.playerSheet:getHeight())

    Animation.idle = anim8.newAnimation(grid('1-6', 1), 0.05)
    Animation.run = anim8.newAnimation(grid('1-6', 2), 0.05)
    Animation.jump = anim8.newAnimation(grid('1-6', 3), 0.05)
end

function Animation:update(dt)
    Animation.idle:update(dt)
end

function Animation:draw()
    Animation.run:draw(Sprites.playerSheet, 0, 0)
end