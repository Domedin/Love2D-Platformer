Player = {}

function Player:load()
    player = world:newRectangleCollider(360, 100, 40, 60, {collision_class = "Player"})
    player:setFixedRotation(true)
    player.speed = 360
    player.animation = Animation.idle
    player.isMoving = false
    player.direction = 1
    player.grounded = true
end

function Player:Update(dt) -- fake update function real update function does not work fix
    Player:playerMovement(dt)
end

function Player:playerMovement(dt)
    if player.body then

        colliders = world:queryRectangleArea(player:getX() - 40, player:getY() + 30, 80, 2, {'Platform'})
        if #colliders > 0 then
            player.grounded = true
        else
            player.grounded = false
        end

        player.isMoving = false
        local px, py = player:getPosition()
        if love.keyboard.isDown('d') then
            player:setX(px + player.speed * dt)
            player.isMoving = true
            player.direction = 1
        end

        if love.keyboard.isDown('a') then
            player:setX(px - player.speed * dt)
            player.isMoving = true
            player.direction = -1
        end

        if player:enter('Danger') then
            player:destroy()
        end
    end
end

function love.keypressed(key)
    if key == 'space' and player.body then
        if player.grounded then
            player:applyLinearImpulse(0, -5500)
            player.animation = Animation.jump
        end
    end
end
