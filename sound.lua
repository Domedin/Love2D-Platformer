Sound = {}

function Sound:load()
    Sound.jump = love.audio.newSource("Audio/jump.wav", "static")
    Sound.music = love.audio.newSource("Audio/tense-detective-looped-drone-10054.mp3", "stream")
    Sound.music:setLooping(true)

    Sound.music:play()
end