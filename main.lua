function love.load()
    wf = require 'libraries/windfield/windfield'
    world = wf.newWorld(0, 2700, false)

    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    world:addCollisionClass('Danger')

    player = world:newRectangleCollider(360, 100, 80, 80, {collision_class = "Player"})
    player.speed = 360

    platform = world:newRectangleCollider(0, 400, 600, 100, {collision_class = "Platform"})
    platform:setType('static')

    dangerZone = world:newRectangleCollider(0, 550, 800, 50, {collision_class = "Danger"})
    dangerZone:setType('static')
end

function love.update(dt)
    world:update(dt)

    local px, py = player:getPosition()

    if love.keyboard.isDown('d') then
        player:setX(px + player.speed * dt)
    end

    if love.keyboard.isDown('a') then
        player:setX(px - player.speed * dt)
    end
end

function love.draw()
    world:draw()
end

function love.keypressed(key)
    if key == 'space' then
        player:applyLinearImpulse(0, -12500)
    end
end