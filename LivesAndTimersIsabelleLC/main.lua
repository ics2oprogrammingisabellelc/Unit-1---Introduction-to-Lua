-- Title: LivesAndTimers
-- Name: Isabelle LC
-- Course: ICS2O/3C
-- This program displays math questions while have the user answer
-- them with a time limit of 10-15 seconds and 3 hearts.
-- If the user gets the answer wrong, or runs out of time, 
-- they will lose a life.
----------------------------------------------------------------------------

-- variables for the timer
local totalSeconds = 15
local secondsLeft = 15
local clockText
local countDownTimer
local pointsObject
local points

local lives = 3
local heart1
local heart2
local heart3
-----------------------------------------------------------------------------

-- variables for incorrect, correct, & points
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

local pointsObject
local points

----------------------------------------------------------------------------
-- Object Creation
----------------------------------------------------------------------------

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100 ,100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100 , 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

----------------------------------------------------------------------------
-- Local Functions
----------------------------------------------------------------------------

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object

clockText.Text = secondsLeft .. ""

if (secondsLeft == 0) then
	-- reset the number of seconds left
	secondsLeft = totalSeconds
	lives = lives - 1

	-- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A YOU LOSE IMAGE
	-- AND CANCEL THE TIMER, REMOVE THE THIRD HEART BY MAKING IT INVISIBLE
	if (lives == 2) then
		heart2.isVisible = false
	elseif (lives == 1) then
		heart1.isVisible = false
	end

	-- *** CALL THE FUNCTION TO ASK A NEW QUESTION
end

-- function that calls timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

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
questionObject:setTextColor(1, 1, 0)

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

clockText = display.newText( "" .. secondsLeft, display.contentWidth/4, display.contentHeight/2, nil, 50 )
clockText:setTextColor(1, 1, 0)

-----------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------------------

-- call the funtion to ask the question
AskQuestion()