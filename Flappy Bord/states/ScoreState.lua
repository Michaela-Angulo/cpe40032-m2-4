--[[
    ScoreState Class

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}
local Gold = love.graphics.newImage('Gold.png')
local Silver = love.graphics.newImage('Silver.png')
local Bronze = love.graphics.newImage('Bronze.png')
local Zero = love.graphics.newImage('Zero.png')

local Bgscore = love.graphics.newImage('bg.png')
--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.draw(Bgscore, 0, 0)
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oopss! You lost!', 0, 44, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 80, VIRTUAL_WIDTH, 'center')
    if self.score < 11 and self.score > 0 then
        love.graphics.draw(Bronze, 235, 100)
        love.graphics.printf('You got a BRONZE!!', 0, 160, VIRTUAL_WIDTH, 'center')
    elseif self.score > 10 and self.score < 21 then
        love.graphics.draw(Silver, 235, 100)
        love.graphics.printf('You got a SILVER!!', 0, 160, VIRTUAL_WIDTH, 'center')
    elseif self.score > 20 and self.score < 31 then
        love.graphics.draw(Gold, 235, 100)
        love.graphics.printf('You got a GOLD!!', 0, 160, VIRTUAL_WIDTH, 'center')
    elseif self.score == 0 then
        love.graphics.draw(Zero, 200, 110)
        love.graphics.printf('What happened??', 0, 170, VIRTUAL_WIDTH, 'center')
       
    
    end
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end