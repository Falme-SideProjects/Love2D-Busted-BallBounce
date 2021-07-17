local Ball = {
	x = 0,
	y = 0,
	size=0,
	velocityX=1,
	velocityY=1,
	directionRight = true,
	directionDown = true
}

function Ball:Reset()
	self.x = 0
	self.y = 0
	self.size = 0
	self.directionRight = true
	self.directionDown = true
	self.velocityX = 1
	self.velocityY = 1
end

function Ball:Initialize()
	self.x=250
	self.y=200
	self.size=20
	self.velocityX = 5
	self.velocityY = 5
end

function Ball:Update(dt)
	self:MoveX()
	self:MoveY()
end

function Ball:Draw()
	love.graphics.rectangle("fill",self.x,self.y,20,20)
end

function Ball:MoveX()
	
	if self:GetDirectionX() then
		self.x=self.x+self:GetVelocityX()
	else
		self.x=self.x-self:GetVelocityX()
	end

	if(self:IsOutOfBoundsX(love.graphics.getWidth())) then	
		self:ReflectX()
	end
end

function Ball:MoveY()
	
	if self:GetDirectionY() then
		self.y = self.y+self.velocityY
	else
		self.y = self.y-self.velocityY
	end

	if self:IsOutOfBoundsY(love.graphics.getHeight()) then	
		self:ReflectY()
	end
end

function Ball:GetX()
	return self.x
end

function Ball:GetY()
	return self.y
end

function Ball:SetX(x)
	self.x = x
end

function Ball:SetY(y)
	self.y = y
end

function Ball:GetSize()
	return self.size
end

function Ball:SetSize(size)
	self.size = size
end

function Ball:ReflectX()
	self.directionRight = not self.directionRight
end

function Ball:ReflectY()
	self.directionDown = not self.directionDown
end

function Ball:GetDirectionX()
	return self.directionRight
end

function Ball:GetDirectionY()
	return self.directionDown
end

function Ball:SetDirectionX(direction)
	self.directionRight = direction
end

function Ball:SetDirectionY(direction)
	self.directionDown = direction
end

function Ball:GetVelocityX()
	return self.velocityX
end

function Ball:GetVelocityY()
	return self.velocityY
end

function Ball:IsOutOfBoundsX(canvasWidth)
	return self:GetX() < 0 or self:GetX() > (canvasWidth-self.size)
end

function Ball:IsOutOfBoundsY(canvasHeight)
	return self:GetY() < 0 or self:GetY() > (canvasHeight-self.size)
end

return Ball