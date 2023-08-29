require("physics")
require("Anim")
require("player")

function love.load()
    Physics:load()
    Animation:load()
    Player:load()
end

function love.update(dt)
    Physics:update(dt)
    Animation:update(dt)
end

function love.draw()
    Physics:draw()
    Animation:draw()
end