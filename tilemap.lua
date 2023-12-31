TileMap = {}

function TileMap:load()
    sti = require 'libraries/Simple-Tiled-Implementation/sti'
    require('libraries/show')
    platforms = {}

    saveData = {}
    saveData.currentLevel = "levelOne"

    if love.filesystem.getInfo("data.lua") then
        local data = love.filesystem.load("data.lua")
        data()
    end
    TileMap:loadMap(saveData.currentLevel)
end

function TileMap:update(dt)
    gameMap:update(dt)
    TileMap:CheckLevelCompletion()
end

function TileMap:draw()
    gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
end

function TileMap:loadMap(mapName)
    saveData.currentLevel = mapName
    love.filesystem.write("data.lua", table.show(saveData, "saveData"))
    TileMap:destroyAll()
    player:setPosition(Player.startX, Player.startY)
    gameMap = sti("maps/" .. mapName .. ".lua")

    for i, obj in pairs(gameMap.layers["Platforms"].objects) do
        TileMap:spawnPlatform(obj.x, obj.y, obj.width, obj.height)
    end
    for i, obj in pairs(gameMap.layers["Enemies"].objects) do
        Enemies:spawnEnemy(obj.x, obj.y)
    end
    for i, obj in pairs(gameMap.layers["Flag"].objects) do
        FlagX = obj.x
        FlagY = obj.y
        print(FlagX)
        print(FlagY)
    end
end

function TileMap:CheckLevelCompletion()
    local colliders = world:queryCircleArea(FlagX, FlagY, 20, {'Player'})
    if #colliders > 0 then
        if saveData.currentLevel == "levelOne" then
            TileMap:loadMap("levelTwo")
        elseif saveData.currentLevel == "levelTwo" then
            TileMap:loadMap("levelThree")
        elseif saveData.currentLevel == "levelThree" then
            TileMap:loadMap("levelOne")
        end
    end
end

function TileMap:destroyAll()
    local i = #platforms
    while i > -1 do
        if platforms[i] ~= nil then
            platforms[i]:destroy()
        end
        table.remove(platforms, i)
        i = i - 1
    end

    local i = #Enemies
    while i > -1 do
        if Enemies[i] ~= nil then
            Enemies[i]:destroy()
        end
        table.remove(Enemies, i)
        i = i - 1
    end
end

function TileMap:spawnPlatform(x, y, width, height)
    if width > 0 and height > 0 then
        local platform = world:newRectangleCollider(x, y, width, height, {collision_class = "Platform"})
        platform:setType('static')
        table.insert(platforms, platform)
    end
end