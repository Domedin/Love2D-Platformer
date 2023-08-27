require("physics")
require("playerAnim")

function love.load()
    Physics:load()
    Animation:load()
end

function love.update(dt)
    Physics:update(dt)
    Animation:update(dt)
end

function love.draw()
    Physics:draw()
    Animation:draw()
end