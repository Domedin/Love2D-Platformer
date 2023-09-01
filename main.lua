require("physics")
require("Anim")
require("player")
require("tilemap")

function love.load()
    Physics:load()
    Animation:load()
    Player:load()
    TileMap:load()
end

function love.update(dt)
    Physics:update(dt)
    Animation:update(dt)
    Player:Update(dt)
    TileMap:update(dt)
end

function love.draw()
    Physics:draw()
    Animation:draw()
    TileMap:draw()
end