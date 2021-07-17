package.path = package.path .. ";../?.lua"
local ball = require('ball')

_G.love = {
	graphics = {
		
	}
}

function love.graphics.getWidth() return 500 end
function love.graphics.getHeight() return 400 end

describe("Initialize", function()
	
	before_each(function() 
		ball:Initialize()
	end)

	it("Ball is not X:0", function()
		assert.are_not.equal(0, ball:GetX())
	end)

	it("Ball X is on the center of the Screen", function()
		assert.are.equal(250, ball:GetX())
	end)

	it("Ball is not Y:0", function()
		assert.are_not.equal(0, ball:GetY())
	end)

	it("Ball Y is on the center of the Screen", function()
		assert.are.equal(200, ball:GetY()) 
	end)

	it("Ball Size is a standard 20x20", function()
		assert.are.equal(20, ball:GetSize())
	end)

end)

describe("GetX", function()

	before_each(function() 
		ball:Reset()
	end)

	it("Ball X is Zero if it's not initialized", function()
		assert.are.equal(0,  ball:GetX())
	end)
	
end)

describe("GetY", function()
	
	ball:Reset()
	
	it("Ball Y is Zero if it's not initialized", function()
		assert.are.equal(0,  ball:GetY())
	end)

end)

describe("GetSize", function()
	ball:Reset()

	it("Get Size without initialize return zero", function()
		assert.are.equal(0, ball:GetSize())
	end)
end)

describe("SetSize", function()
	
	
	it("Set size to 0, is 0", function()
		ball:SetSize(0)

		assert.are.equal(0, ball:GetSize())
	end)
	
	it("Set size to 40, is 40", function()
		ball:SetSize(40)

		assert.are.equal(40, ball:GetSize())
	end)
end)

describe("MoveX", function()

	before_each(function() 
		ball:Reset()
	end)

	it("Move Positive to X set X position to 1", function()
		ball:SetX(0)
		ball:SetDirectionX(true)
		ball:MoveX()
		assert.are.equal(1, ball:GetX())
	end)

	it("Move Positive to X set X position to 101", function()
		ball:SetX(100)
		ball:SetDirectionX(true)
		ball:MoveX()
		assert.are.equal(101, ball:GetX())
	end)

	it("Move Negative to X set X position to 99", function()
		ball:SetX(100)
		ball:SetDirectionX(false)
		ball:MoveX()
		assert.are.equal(99, ball:GetX())
	end)

	it("Move Negative to X set X position to -1", function()
		ball:SetX(0)
		ball:SetDirectionX(false)
		ball:MoveX()
		assert.are.equal(-1, ball:GetX())
	end)

	it("Move to set Direction independtly the input", function()
		ball:SetX(0)
		ball:SetDirectionX(true)
		ball:MoveX()
		assert.are.equal(1, ball:GetX())
	end)

	
	it("After initialization Move is with 5 speed to right", function()
		ball:Initialize()

		ball:SetX(0)
		ball:MoveX()
		assert.are.equal(5, ball:GetX())
	end)
	
	
	it("After initialization Move is with 5 speed to left", function()
		ball:Initialize()
		
		ball:SetX(0)
		ball:SetDirectionX(false)
		ball:MoveX()
		assert.are.equal(-5, ball:GetX())
	end)

end)

describe("MoveY", function()

	before_each(function() 
		ball:Reset()
	end)

	it("MoveY from position 0 go to 1", function()
		ball:MoveY()
		assert.are.equal(1, ball:GetY())
	end)

	it("MoveY Positive from position 0 go to 1", function()
		ball:SetDirectionY(true)
		ball:MoveY()
		assert.are.equal(1, ball:GetY())
	end)

	it("MoveY Negative from position 0 go to 1", function()
		ball:SetDirectionY(false)
		ball:MoveY()
		assert.are.equal(-1, ball:GetY())
	end)

	it("MoveY positive after initialize", function()
		ball:Initialize()
		ball:SetY(0)
		ball:MoveY()
		assert.are.equal(5, ball:GetY())
	end)
	

	it("MoveY negative after initialize", function()
		ball:Initialize()
		ball:SetY(0)
		ball:SetDirectionY(false)
		ball:MoveY()
		assert.are.equal(-5, ball:GetY())
	end)

end)

describe("SetX", function()

	ball:Reset()

	it("Change X to 10, X need to be 10", function()
		ball:SetX(10)
		assert.are.equal(10, ball:GetX())
	end)

	it("Change X to -10, X need to be -10", function()
		ball:SetX(-10)
		assert.are.equal(-10, ball:GetX())
	end)
end)

describe("SetY", function()
	
	before_each(function() 
		ball:Reset()
	end)
	
	it("Set Y to 10, Y is 10", function()
		ball:SetY(10)
		assert.are.equal(10, ball:GetY())
	end)
end)

describe("SetDirectionX", function()

	ball:Reset()

	it("Change Direction to Right", function()
		ball:SetDirectionX(true)
		assert.are.equal(true, ball:GetDirectionX())
	end)

	it("Change Direction to Left", function()
		ball:SetDirectionX(false)
		assert.are.equal(false, ball:GetDirectionX())
	end)
end)

describe("SetDirectionY", function()
	
	before_each(function() 
		ball:Reset()
	end)
	
	it("Change Direction to Down", function()
		ball:SetDirectionY(true)
		assert.are.equal(true, ball:GetDirectionY())
	end)
	
	it("Change Direction to Up", function()
		ball:SetDirectionY(false)
		assert.are.equal(false, ball:GetDirectionY())
	end)
end)

describe("GetDirectionX", function()

	ball:Reset()

	it("Initially Direction X is to move to right", function()
		assert.are.equal(true, ball:GetDirectionX())
	end)
end)

describe("GetDirectionY", function()
	it("Initially direction Y is to move down", function()
		ball:Reset()
		assert.are.equal(true, ball:GetDirectionY())
	end)
end)

describe("ReflectX", function()

	ball:Reset();

	it("On Initialize reflect x makes Direction x to false", function()
		ball:ReflectX()
		assert.are.equal(false, ball:GetDirectionX())
	end)

	it("after reflect x, calling again makes Direction x to true", function()
		ball:ReflectX()
		assert.are.equal(true, ball:GetDirectionX())
	end)
end)

describe("ReflectY", function()
	
	ball:Reset()
	
	it("On reflect on Initialize, set direction to up", function()
		ball:ReflectY()
		assert.are.equal(false, ball:GetDirectionY())
	end)
	
	it("On reflect again, set direction to down", function()
		ball:ReflectY()
		assert.are.equal(true, ball:GetDirectionY())
	end)
end)

describe("GetVelocityX", function()
	
	ball:Reset()
	
	it("Without Initialization velocity X is 1", function()
		assert.are.equal(1, ball:GetVelocityX())
	end)
	
	it("With Initialization velocity X is 5", function()
		ball:Initialize()
		assert.are.equal(5, ball:GetVelocityX())
	end)
end)

describe("GetVelocityY", function()
	
	before_each(function() 
		ball:Reset()
	end)
	
	it("Without initialize, velocity Y is 1", function()
		assert.are.equal(1, ball:GetVelocityY())
	end)
	
	it("With initialize, velocity Y is 5", function()
		ball:Initialize()
		assert.are.equal(5, ball:GetVelocityY())
	end)
end)

describe("IsOutOfBoundsX", function()
	
	before_each(function() 
		ball:Reset()
		ball:SetSize(20)
	end)
	
	it("Without change position and Without initialize, is in bounds", function()
		assert.are.equal(false, ball:IsOutOfBoundsX(500))
	end)
	
	it("Without change position and With initialize, is in bounds", function()
		ball:Initialize()
		assert.are.equal(false, ball:IsOutOfBoundsX(500))
	end)
	
	it("Without change X to 0, is in bounds", function()
		ball:SetX(0)
		assert.are.equal(false, ball:IsOutOfBoundsX(500))
	end)
	
	it("Without change X to -1, is out of bounds", function()
		ball:SetX(-1)
		assert.are.equal(true, ball:IsOutOfBoundsX(500))
	end)
	
	it("Without change X to -20, is out of bounds", function()
		ball:SetX(-20)
		assert.are.equal(true, ball:IsOutOfBoundsX(500))
	end)

	it("Without change X to 481, is out bounds", function()
		ball:SetX(481)
		assert.are.equal(true, ball:IsOutOfBoundsX(500))
	end)

	it("Without change X to 480, is in bounds", function()
		ball:SetX(480)
		assert.are.equal(false, ball:IsOutOfBoundsX(500))
	end)
	
	it("Without change X to 500, is in bounds", function()
		ball:SetX(500)
		assert.are.equal(true, ball:IsOutOfBoundsX(500))
	end)
	
	it("Without change X to 501, is out bounds", function()
		ball:SetX(501)
		assert.are.equal(true, ball:IsOutOfBoundsX(500))
	end)
	
	it("Without change X to 1001, is out bounds", function()
		ball:SetX(1001)
		assert.are.equal(true, ball:IsOutOfBoundsX(500))
	end)
end)

describe("IsOutOfBoundsY", function()
	
	before_each(function() 
		ball:Reset()
		ball:SetSize(20)
	end)
	
	it("On initial position, is in bounds", function()
		assert.are.equal(false, ball:IsOutOfBoundsY(500))
	end)
	
	it("On initialized position, is in bounds", function()
		ball:Initialize()
		assert.are.equal(false, ball:IsOutOfBoundsY(500))
	end)
	
	it("On position 0, is in bounds", function()
		ball:SetY(0)
		assert.are.equal(false, ball:IsOutOfBoundsY(500))
	end)

	
	it("On position 480, is in bounds", function()
		ball:SetY(480)
		assert.are.equal(false, ball:IsOutOfBoundsY(500))
	end)

	
	it("On position 481, is out bounds", function()
		ball:SetY(481)
		assert.are.equal(true, ball:IsOutOfBoundsY(500))
	end)
	
	it("On position 500, is out bounds", function()
		ball:SetY(500)
		assert.are.equal(true, ball:IsOutOfBoundsY(500))
	end)

	it("On position -1, is out of bounds", function()
		ball:SetY(-1)
		assert.are.equal(true, ball:IsOutOfBoundsY(500))
	end)

	it("On position 501, is out of bounds", function()
		ball:SetY(501)
		assert.are.equal(true, ball:IsOutOfBoundsY(500))
	end)
end)

describe("MoveX -> IsOutOfBoundsX", function()
	
	before_each(function() 
		ball:Reset()
	end)
	
	it("On MoveX call IsOutOfBoundsX", function()
		local s = spy.on(ball, "IsOutOfBoundsX") 

		ball:MoveX()

		assert.spy(s).was.called()
	end)
end)

describe("MoveY -> IsOutOfBoundsY", function()
	
	before_each(function() 
		ball:Reset()
	end)
	
	it("On Call MoveY, make a call for IsOutOfBoundsY", function()
		local s = spy.on(ball, "IsOutOfBoundsY")
		
		ball:MoveY()

		assert.spy(s).was_called()
	end)
end)

describe("MoveX -> ReflectX", function()
	
	before_each(function() 
		ball:Reset()
	end)
	
	it("If in bounds, MoveX do not call ReflectX", function()
		local s = spy.on(ball, "ReflectX")

		ball:SetX(100)
		ball:MoveX()

		assert.spy(s).was_not.called()
	end)
	
	it("If out positive bounds, MoveX do not call ReflectX", function()
		local s = spy.on(ball, "ReflectX")

		ball:SetX(600)
		ball:MoveX()

		assert.spy(s).was_called()
	end)
	
	it("If out negative bounds, MoveX do not call ReflectX", function()
		local s = spy.on(ball, "ReflectX")

		ball:SetX(-5)
		ball:MoveX()

		assert.spy(s).was_called()
	end)
end)

describe("MoveY -> ReflectY", function()
	
	before_each(function() 
		ball:Reset()
	end)
	
	it("If Out of bounds Call reflect Y", function()
		local s = spy.on(ball, "ReflectY")
		
		ball:SetY(600)
		ball:MoveY()

		assert.spy(s).was_called()
	end)
	
	it("If in bounds NOT Call reflect Y", function()
		local s = spy.on(ball, "ReflectY")
		
		ball:SetY(100)
		ball:MoveY()

		assert.spy(s).was_not_called()
	end)
end)

describe("GetCanvasWidth", function()
	
	before_each(function() 
		ball:Reset()
	end)
	
	it("On Canvas Width Call, Return Love window Size", function()
		
		local s = spy.on(love.graphics, "getWidth")
		
		ball:MoveX()

		assert.spy(s).was_called()
	end)
end)

describe("GetCanvasHeight", function()
	
	before_each(function() 
		ball:Reset()
	end)
	
	it("On canvas height call, return love window size", function()
		
		local s = spy.on(love.graphics, "getHeight")
		
		ball:MoveY()

		assert.spy(s).was_called()
	end)
end)