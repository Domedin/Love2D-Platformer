TileMap = {}

function TileMap:load()
    sti = require 'libraries/Simple-Tiled-Implementation/sti'
    TileMap:loadMap()
end

function TileMap:update(dt)
    gameMap:update(dt)
end

function TileMap:draw()
    gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
end

function TileMap:loadMap()
    gameMap = sti("maps/levelOne.lua")
end