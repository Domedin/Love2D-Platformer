Animation = {}

function Animation:load()
    anim8 = require 'libraries/anim8/anim8'

    Sprites = {}
    Sprites.playerSheet = love.graphics.newImage('sprites/PlayerAnimations.png')

    local grid = anim8.newGrid(110, 100, Sprites.playerSheet:getWidth(), Sprites.playerSheet:getHeight())

    Animation.idle = anim8.newAnimation(grid('1-6', 1), 0.1)
    Animation.run = anim8.newAnimation(grid('1-6', 2), 0.1)
    Animation.jump = anim8.newAnimation(grid('1-6', 3), 0.1)
end

function Animation:update(dt)
    if Player.isMoving then
        Player.animation = Animation.run
    else
        Player.animation = Animation.idle
    end

    Player.animation:update(dt)
end

function Animation:draw()
    if Player.body then
        local px, py = Player:getPosition()

        Player.animation:draw(Sprites.playerSheet, px, py, nil, 0.7 * Player.direction, 0.7, 40, 50)
    end
end