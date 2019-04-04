-- Title: WhackAMole
-- Name: Your Name
-- Course: ICS2O/3C
-- This program places a random object on the screen. If  the user clicks on it in time, the score
-- increases by 1.
---------------------------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)
---------------------------------------------------------------------------------------------------------
-- BACKGROUND
---------------------------------------------------------------------------------------------------------

-- set intial background color
display.setDefault("background", 255/255, 190/255, 0)

---------------------------------------------------------------------------------------------------------
-- CREATE MOLE
---------------------------------------------------------------------------------------------------------

-- creating mole
local mole = display.newImage("Images/mole.png", 0, 0)

-- setting position
mole.x = display.contentCenterX
mole.y = display.contentCenterY

-- scale down the size to be a third of the original size.
mole:scale(0.3, 0.3)

-- set the mole to be invisible
mole.isVisible = false
---------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES 4 SCORE
---------------------------------------------------------------------------------------------------------

local score = 0
local scoreObject
---------------------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------------------
-- Function that makes the mole appear in a random (x,y) position on the screen before calling hide
-- function

function PopUp( )

	-- choose a random posiion on the screen between 0 and the size of the screen.
	mole.x = math.random(0, display.contentWidth)
	mole.y = math.random(0, display.contentHeight)

	-- make the mole visible
	mole.isVisible = true

	-- hide the function after 500 miliseconds.
	timer.performWithDelay(750, Hide)
end

-- this function calls the PopUp function after 3 seconds
function PopUpDelay( )
	timer.performWithDelay(3000, PopUp)
end

-- this function makes the mole invisible and then calls the PopUpDelay function
function Hide( )

	-- change the visibility
	mole.isVisible = false

	-- call PopUpDelay function
	PopUpDelay()
end

-- this function starts the game
function GameStart( )
	PopUpDelay()
end

-- this function increments the score only if the mole uis clicked. it then displays the new score.
function Whacked( event )

	-- if touch phase just started
	if (event.phase == "began") then
		score = score + 1
		scoreObject = display.newText( score, display.contentWidth/2, display.contentHeight/8, nil, 50 )
		scoreObject:setTextColor(0, 0, 0)
		scoreObject.isVisible = true
	end

	if (event.phase == "ended") then
		scoreObject.isVisible = false
	end
end

--------------------------------------------------------------------------------------------------------
-- EVENT LISTENERS
--------------------------------------------------------------------------------------------------------

-- added the event listener to the moles so that if the mole is touched, the whacked function is
-- called
mole:addEventListener( "touch", Whacked )

--------------------------------------------------------------------------------------------------------
-- CALL THESE FUNCTIONS
--------------------------------------------------------------------------------------------------------
GameStart()
PopUp()