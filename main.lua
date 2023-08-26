require("physics")

function love.load()
    Physics:load()
end

function love.update(dt)
    Physics:update(dt)
end

function love.draw()
    Physics:draw()
end