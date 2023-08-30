Physics = {}

function Physics:load()
    wf = require 'libraries/windfield/windfield'
    world = wf.newWorld(0, 4000, false)
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

        colliders = world:queryRectangleArea(Player:getX() - 40, Player:getY() + 30, 80, 2, {'Platform'})
        if #colliders > 0 then
            Player.grounded = true
        else
            Player.grounded = false
        end

        Player.isMoving = false
        local px, py = Player:getPosition()
        if love.keyboard.isDown('d') then
            Player:setX(px + Player.speed * dt)
            Player.isMoving = true
            Player.direction = 1
        end

        if love.keyboard.isDown('a') then
            Player:setX(px - Player.speed * dt)
            Player.isMoving = true
            Player.direction = -1
        end

        if Player:enter('Danger') then
            Player:destroy()
        end
    end
end