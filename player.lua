Player = {}

function Player:load()
    Player = world:newRectangleCollider(360, 100, 40, 60, {collision_class = "Player"})
    Player:setFixedRotation(true)
    Player.speed = 360
    Player.animation = Animation.idle
    Player.isMoving = false
    Player.direction = 1
end

function Player:update(dt)
    
end

function Player:draw()

end

function love.keypressed(key)
    if key == 'space' and Player.body then
        local colliders = world:queryRectangleArea(Player:getX() - 40, Player:getY() + 30, 80, 2, {'Platform'})
        if #colliders > 0 then
            Player:applyLinearImpulse(0, -5000)
        end
    end
end
