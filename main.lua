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
    Sound:load()
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
    love.graphics.draw(Sprites.background, 0, 0)
    cam:attach()
        TileMap:draw()
        Animation:draw()
        Enemies:draw()
    cam:detach()
end