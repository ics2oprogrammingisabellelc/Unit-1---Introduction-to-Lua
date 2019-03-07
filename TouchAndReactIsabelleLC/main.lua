-- Title: TouchAndReact
-- Name: Isabelle LC
-- Course: ICS2O/3C
-- This program displays a button that changes when clicked.
----------------------------------------------------------------------------

-- set background colour
display.setDefault("background", 229/255, 255/255, 204/255)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

local backgroundImage = display.newImageRect("Images/1.jpg", 2048, 1536)
backgroundImage.isVisible = false

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

local angel = display.newImageRect("Images/angel.png", 200, 200)
angel.x =200
angel.y = 600
angel.isVisible = false

local devil = display.newImageRect("Images/devil.png", 200, 200)
devil.x = 800
devil.y = 200
devil.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor(0, 0, 0)
textObject.isVisible = false

local correct = audio.play("Sounds/Correct Answer Sound Effect.mp3")
--------------------------------------------------------------------------------------

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red 
-- button, and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		correct = true
		angel.isVisible = true
		devil.isVisible = true
		backgroundImage.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		textObject.isVisible = false
		redButton.isVisible = false
		correct = false
		angel.isVisible = false
		devil.isVisible = false
		backgroundImage.isVisible = false
	end
end

-- Function: RedButtonListener
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		redButton.isVisible = true
		blueButton.isVisible = false
		textObject.isVisible = true
		correct = true
		angel.isVisible = true
		devil.isVisible = true
		backgroundImage.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		textObject.isVisible = false
		redButton.isVisible = false
		correct = false
		angel.isVisible = false
		devil.isVisible = false
		backgroundImage.isVisible = false
	end
end

-- Function: SoundListener
local function CorrectSoundListener(touch)
	if (touch.phase == "began") then
		redButton.isVisible = true
		blueButtun.isVisible = false
		textObject.isVisible = true
		correct = true
		angel.isVisible = true
		devil.isVisible = true
		backgroundImage.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		textObject.isVisible = false
		redButton.isVisible = false
		correct = false
		angel.isVisible = false
		devil.isVisible = false
		backgroundImage.isVisible = false
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)