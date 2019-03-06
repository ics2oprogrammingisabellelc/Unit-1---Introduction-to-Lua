-- Title: TouchAndDrag
-- Name: Isabelle LC
-- Course: ICS2O/3C
-- This program displays images that react to a person's finger.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables.
local backgroungImage = display.newImageRect("Images/background.png", 2048, 1536)
local girlOne = display.newImageRect("Images/girl1.png", 150, 150)
local girlOneWidth = girlOne.width
local girlOneHeight = girlOne.height

local girlTwo = display.newImageRect("Images/girl2.png", 150, 150)
local girlTwoWidth = girlTwo.width
local girlTwoHeight = girlTwo.height

local girlThree = display.newImageRect("Images/girl3.png", 150, 150)
local girlThreeWidth = girlThree.width
local girlThreeHeight = girlThree.height

-- my bolean variables to keep track of which object I touched first
local alreadyTouchedGirlOne = false
local alreadyTouchedGirlTwo = false
local alreadyTouchedGirlThree = false

-- set the initial x and y position of my Image
girlOne.x = 300
girlOne.y = 500

girlTwo.x = 500
girlTwo.y = 500

girlThree.x = 700
girlThree.y = 500

-- Function: GirlOneListener
-- Input: touch listener
-- Output: none
-- Description: when girl one is touched, move her
local function GirlOneListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedGirlTwo == false) and (alreadyTouchedGirlThree == false) then
			alreadyTouchedGirlOne = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirlOne == true) ) then
		girlOne.x = touch.x
		girlOne.y = touch.y
	end
	
	if	(touch.phase == "ended") then
		alreadyTouchedGirlOne = false
		alreadyTouchedGirlTwo = false
		alreadyTouchedGirlThree = false
	end
end

-- add respective listener
girlOne:addEventListener("touch", GirlOneListener)

-------------------------------------------------------------------------------

-- Function
local function GirlTwoListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedGirlOne == false) and (alreadyTouchedGirlThree == false) then
			alreadyTouchedGirlTwo = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirlTwo == true) ) then
		girlTwo.x = touch.x
		girlTwo.Y = touch.y
	end

	if	(touch.phase == "ended") then
		alreadyTouchedGirlOne = false
		alreadyTouchedGirlTwo = false
		alreadyTouchedGirlThree = false
	end
end

-- add respective listener
girlTwo:addEventListener("touch", GirlTwoListener)

-------------------------------------------------------------------------------

-- Function
local function GirlThreeListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedGirlOne == false) and (alreadyTouchedGirlTwo == false) then
			alreadyTouchedGirlThree = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedGirlThree == true) ) then
		girlThree.x = touch.x
		girlThree.Y = touch.y
	end

	if  (touch.phase == "ended") then
		alreadyTouchedGirlOne = false
		alreadyTouchedGirlTwo = false
		alreadyTouchedGirlThree = false
	end
end

-- add respective listener
girlThree:addEventListener("touch", GirlThreeListener)