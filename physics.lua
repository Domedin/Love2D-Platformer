Physics = {}

function Physics:load()
    wf = require 'libraries/windfield/windfield'
    world = wf.newWorld(0, 2700, false)
    world:setQueryDebugDrawing(true)

    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    world:addCollisionClass('Danger')

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
    if Player.body then
        local px, py = Player:getPosition()
        if love.keyboard.isDown('d') then
            Player:setX(px + Player.speed * dt)
        end

        if love.keyboard.isDown('a') then
            Player:setX(px - Player.speed * dt)
        end

        if Player:enter('Danger') then
            Player:destroy()
        end
    end
end

function love.keypressed(key)
    if key == 'space' and Player.body then
        local colliders = world:queryRectangleArea(Player:getX() - 40, Player:getY() + 40, 80, 2, {'Platform'})
        if #colliders > 0 then
            Player:applyLinearImpulse(0, -12500)
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