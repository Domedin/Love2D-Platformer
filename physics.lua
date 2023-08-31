Physics = {}

function Physics:load()
    wf = require 'libraries/windfield/windfield'
    world = wf.newWorld(0, 4000, false)
    world:setQueryDebugDrawing(false)

    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    world:addCollisionClass('Danger')

    platform = world:newRectangleCollider(300, 400, 600, 100, {collision_class = "Platform"})
    platform:setType('static')

    dangerZone = world:newRectangleCollider(0, 550, 1280, 50, {collision_class = "Danger"})
    dangerZone:setType('static')
end

function Physics:update(dt)
    world:update(dt)
end

function Physics:draw()
    world:draw()
end

