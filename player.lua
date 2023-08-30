Player = {}

function Player:load()
    Player = world:newRectangleCollider(360, 100, 40, 60, {collision_class = "Player"})
    Player:setFixedRotation(true)
    Player.speed = 360
    Player.animation = Animation.idle
    Player.isMoving = false
    Player.direction = 1
    Player.grounded = true
end

function Player:update(dt)
    print('running')
end

function love.keypressed(key)
    if key == 'space' and Player.body then
        if Player.grounded then
            Player:applyLinearImpulse(0, -5000)
            Player.animation = Animation.jump
        end
    end
end
