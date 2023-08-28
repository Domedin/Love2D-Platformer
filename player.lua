Player = {}

function Player:load()
    Player = world:newRectangleCollider(360, 100, 80, 80, {collision_class = "Player"})
    Player:setFixedRotation(true)
    Player.speed = 360
    Player.animation = Animation.idle
end

function Player:update(dt)

end

function Player:draw()

end