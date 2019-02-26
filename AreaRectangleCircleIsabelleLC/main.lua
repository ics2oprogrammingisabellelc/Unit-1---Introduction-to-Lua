-- Title: AreaOfRectangleAndCircle
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a coloured rectangle with border with a different colour.
-- It also calculates the rectangle's area and displays it on the screen.
-- Then I added the code to draw a circle of a given radius that is
-- coloured and a border of a different colour.
-- I used the radius to calculate the area and displayed this on the iPad.

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle

-- set the background colour of my screen. Remember that colours are between 0 and 1.
display.setDefault("background", 187/255, 111/255, 255/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 15

-- set the colour of the rectangle
myRectangle:setFillColor(204/255, 243/255, 253/255)

-- set the colour of the border
myRectangle:setStrokeColor(0, 0, 0)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of
-- the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. "pixels².", 0,0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 40
areaText.x = 20
areaText.y = display.contentHeight/2

-- Set the colour of the newText
areaText:setTextColor(0/255, 0/255, 40/255)

-- create my local variables
local myCircle
local radiusOfCircle = 100
local areaOfCircle
local areaText
local textSize = 50

-- draw the circle that is half the width and height of the screen size.
myCircle = display.newCircle(0, 0, radiusOfCircle)

-- anchor the circle that is in the top left corner of the screen and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 700
myCircle.y = 20

-- set the width of the border
myCircle.strokeWidth = 15

-- set the colour of the circle
myCircle:setFillColor(161/255, 255/255, 255/255)

-- set the color of the border
myCircle:setStrokeColor(0/255, 0/255, 254/255)

-- calculate the area
areaOfCircle = radiusOfCircle * radiusOfCircle * 3.14159

-- write the area on the screen. Take into consideration the size of
-- the font when positioning it on the screen
areaText = display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle .. " is " ..
	areaOfCircle .. "pixels².", 0,0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

