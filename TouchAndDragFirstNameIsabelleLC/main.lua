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
-- Description: when girl two is touched, move her
local function GirlOneListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedGirlOne == true) then
			alreadyTouchedGirlTwo = false
			alreadyTouchedGirlThree = false
		end
	end

-- add respective listener
girlOne:addEventListener("touch", GirlOneListener)