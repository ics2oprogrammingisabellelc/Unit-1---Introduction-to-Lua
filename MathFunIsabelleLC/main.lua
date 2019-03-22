-- Title: MathFun
-- Name: Isabelle LC
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric textfield terminal
------------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background image
local backgroundImage = display.newImageRect("Images/background.jpg", 2048, 1536)

-- create a character
local character = display.newImageRect("Images/stickman.png", 300, 500)

-- set the (x,y) position of the character
character.x = 160
character.y = 500
-----------------------------------------------------------------------------------------------------
-- Local Variables
-----------------------------------------------------------------------------------------------------

-- create the local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local randomOperator

------------------------------------------------------------------------------------------------------
-- Sounds
------------------------------------------------------------------------------------------------------

-- Correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel

-- Incorrect sound
local incorrectSound = audio.loadSound( "Sounds/wrongSound.mp3" )
local incorrectSoundChannel
------------------------------------------------------------------------------------------------------
-- Local Functions
------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 and 3
	-- ***declare this veriable above
	randomOperator = math.random(1,3)

	-- generate 2 random numbers
	randomNumber1 = math.random(10,20)
	randomNumber2 = math.random(0,10)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in tect object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in the text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	-- if the random operator selected is 3, then do multiplication
	elseif (randomOperator == 3) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	incorrectObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false

			correctSoundChannel = audio.play(correctSound)

			timer.performWithDelay(2000, HideCorrect)
			
		else incorrectObject.isVisible = true
			correctObject.isVisible = false

			incorrectSoundChannel = audio.play(incorrectSound)

			timer.performWithDelay(2000, HideIncorrect)
		end

		-- clear text field
		event.target.text = ""
	end
end
----------------------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(0, 0, 0)

-- create the correct object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(0, 1, 0)
correctObject.isVisible = false

-- create the incorrect object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(1, 0, 0)
incorrectObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener ( "userInput", NumericFieldListener )

-----------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------------------

-- call the cuntion to ask the question
AskQuestion()