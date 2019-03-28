-- Title: PhysicsAndCollisions
-- Name: Isabelle LC
-- Course: ICS2O/3C
-- This program...
-------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
------------------------------------------------------------------------------------
-- Objects
------------------------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)
	ground.x = display.contentWidth/2
	ground.y = display.contentHeight/1.03

	-- Change the width to be the same as the screen
	ground.width = display.contentWidth

	-- Add to physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})
-----------------------------------------------------------------------------------
-- Beam
	local beam = display.newImage("Images/beam.png", 0, 0)
	-- set the x and y position
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	-- set the width of beam
	beam.width = display.contentWidth/2

	-- set the height of beam
	beam.height = display.contentHeight/10

	-- rotate the beam
	beam:rotate(45)

	-- send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

-----------------------------------------------------------------------------------
-- Beam
	local beam = display.newImage("Images/beam.png", 0, 0)
	-- set the x and y position
	beam.x = display.contentCenterX/0.57
	beam.y = display.contentCenterY*1.65

	-- set the width of beam
	beam.width = display.contentWidth/2

	-- set the height of beam
	beam.height = display.contentHeight/10

	-- rotate the beam
	beam:rotate(-45)

	-- send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

------------------------------------------------------------------------------------
	-- create background
local bkg = display.newImage("Images/bkg.png", 0, 0)
	
	-- set the x and y position
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- set the width of the bkg
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	-- send to back
	bkg:toBack()
------------------------------------------------------------------------------------
-- Functions
------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- create the ball
	local ball1 = display.newImage("Images/super_ball.png", 0 ,0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

------------------------------------------------------------------------------------

-- create the first ball
local function secondBall()
	-- create the ball
	local ball2 = display.newImage("Images/super_ball.png", 0 ,0)

	-- add to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	ball2:scale(0.5, 0.5)
end

------------------------------------------------------------------------------------

-- create the first ball
local function thirdBall()
	-- create the ball
	local ball3 = display.newImage("Images/super_ball.png", 0 ,0)

	-- add to physics
	physics.addBody(ball3, {density=1.0, friction=0.5, bounce=0.3, radius=50})

	ball3:scale(2, 2)
end

------------------------------------------------------------------------------------

-- create the first ball
local function fourthBall()
	-- create the ball
	local ball4 = display.newImage("Images/super_ball.png", 0 ,0)

	-- add to physics
	physics.addBody(ball4, {density=1.0, friction=0.5, bounce=0.3, radius=100})

	ball4:scale(4, 4)
end

------------------------------------------------------------------------------------
-- timer delays
------------------------------------------------------------------------------------
timer.performWithDelay(0, firstBall)
timer.performWithDelay(500, secondBall)
timer.performWithDelay(1000, thirdBall)
timer.performWithDelay(1500, fourthBall)