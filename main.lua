require("physics")
require("Anim")
require("player")
require("tilemap")
require("camera")
require("enemy")
require("sound")

function love.load()
    Physics:load()
    Animation:load()
    Player:load()
    TileMap:load()
    Camera:load()
end

function love.update(dt)
    Physics:update(dt)
    Animation:update(dt)
    Player:Update(dt)
    TileMap:update(dt)
    Camera:update(dt)
    Enemies:update(dt)
end

function love.draw()
    cam:attach()
        TileMap:draw()
        Animation:draw()
        Physics:draw()
        Enemies:draw()
    cam:detach()
end