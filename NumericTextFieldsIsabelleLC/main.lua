-- Title: NumericTextFields
-- Name: Isabelle LC
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric
-- textfield terminal.
------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 255/255, 180/255, 80/255)

----------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------
-- Sounds
----------------------------------------------------------------------------------------------

-- correct sound
local correctSound = audio.loadSound( "Sounds/cartoon1.mp3" )
local correctSoundChannel

-- wrong sound
local wrongSound = audio.loadSound( "Sounds/cartoon008.mp3" )
local wrongSoundChannel

----------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 20)
	randomNumber2 = math.random(0, 20)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="
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

			wrongSoundChannel = audio.play(wrongSound)

			timer.performWithDelay(2000,HideIncorrect)
			
		end
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