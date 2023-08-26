Physics = {}

function Physics:load()
    wf = require 'libraries/windfield/windfield'
    world = wf.newWorld(0, 2700, false)
    world:setQueryDebugDrawing(true)

    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    world:addCollisionClass('Danger')

    player = world:newRectangleCollider(360, 100, 80, 80, {collision_class = "Player"})
    player:setFixedRotation(true)
    player.speed = 360

    platform = world:newRectangleCollider(300, 400, 600, 100, {collision_class = "Platform"})
    platform:setType('static')

    dangerZone = world:newRectangleCollider(0, 550, 1280, 50, {collision_class = "Danger"})
    dangerZone:setType('static')
end

function Physics:update(dt)
    Physics:playerMovement(dt)
    world:update(dt)
end

function Physics:draw()
    world:draw()
end

function Physics:playerMovement(dt)
    if player.body then
        local px, py = player:getPosition()
        if love.keyboard.isDown('d') then
            player:setX(px + player.speed * dt)
        end

        if love.keyboard.isDown('a') then
            player:setX(px - player.speed * dt)
        end

        if player:enter('Danger') then
            player:destroy()
        end
    end
end

function love.keypressed(key)
    if key == 'space' and player.body then
        local colliders = world:queryRectangleArea(player:getX() - 40, player:getY() + 40, 80, 2, {'Platform'})
        if #colliders > 0 then
            player:applyLinearImpulse(0, -12500)
        end
    end
end

function love.mousepressed(x, y, button)
    if button ==1 then
        local colliders = world:queryCircleArea(x, y, 200, {'Platform', 'Danger'})
        for i,colliderNum in ipairs(colliders) do
            colliderNum:destroy()
        end
    end
end