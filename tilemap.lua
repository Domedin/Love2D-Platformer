TileMap = {}

function TileMap:load()
    sti = require 'libraries/Simple-Tiled-Implementation/sti'
    platforms = {}
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

    for i, obj in pairs(gameMap.layers["Platforms"].objects) do
        TileMap:spawnPlatform(obj.x, obj.y, obj.width, obj.height)
    end

    for i, obj in pairs(gameMap.layers["Enemies"].objects) do
        Enemies:spawnEnemy(obj.x, obj.y)
    end
end

function TileMap:spawnPlatform(x, y, width, height)
    if width > 0 and height > 0 then
        local platform = world:newRectangleCollider(x, y, width, height, {collision_class = "Platform"})
        platform:setType('static')
        table.insert(platforms, platform)
    end
end