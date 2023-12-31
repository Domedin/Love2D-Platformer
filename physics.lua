Physics = {}

function Physics:load()
    wf = require 'libraries/windfield/windfield'
    world = wf.newWorld(0, 4000, false)
    world:setQueryDebugDrawing(false)

    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    world:addCollisionClass('Danger')

    dangerZone = world:newRectangleCollider(-500, 700, 40000, 50, {collision_class = "Danger"})
    dangerZone:setType('static')
end

function Physics:update(dt)
    world:update(dt)
end
