Camera = {}

function Camera:load()
    cameraFile = require 'libraries/hump/camera'
    cam = cameraFile()
end

function Camera:update(dt)
    if player.body then
        local px, py = player:getPosition()
        cam:lookAt(px, love.graphics.getHeight() / 2)
    end
end