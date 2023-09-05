Enemies = {}

function Enemies:spawnEnemy(x, y)
    local enemy = world:newRectangleCollider(x, y, 40, 60, {collision_class = "Danger"})
    enemy.direction = 1
    enemy.speed = 200
    enemy.animation = Animation.enemy
    table.insert(Enemies, enemy)
end

function Enemies:update(dt)
    Enemies:movement(dt)
end

function Enemies:movement(dt)
    for i,e in ipairs(Enemies) do
        e.animation:update(dt)
        local ex, ey = e:getPosition()
        
        local colliderGround = world:queryRectangleArea(ex + (20 * e.direction), ey + 25, 10, 10, {'Platform'})
        local colliderAir = world:queryRectangleArea(ex + (20 * e.direction), ey, 10, 10, {'Platform'})
        if #colliderGround == 0 then
            e.direction = e.direction * -1
        end
        if #colliderAir == 1 then
            e.direction = e.direction * -1
        end
        e:setX(ex + e.speed * e.direction * dt)
    end
end

function Enemies:draw()
    for i,e in ipairs(Enemies) do
        local ex, ey = e:getPosition()
        e.animation:draw(Sprites.enemySheet, ex, ey, nil, 0.7 * e.direction, 0.7, 40, 50)
    end
end