ball = require('ball')

function love.load()
	ball:Initialize()
end

function love.update(dt)
	ball:Update(dt)
end

function love.draw()
	ball:Draw()
end