--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

ChoosePlayerMenuState = Class{__includes = BaseState}

function ChoosePlayerMenuState:init(choosePlayerState)
    self.choosePlayerState = choosePlayerState
    
    self.choosePlayerMenu = Menu {
        x = VIRTUAL_WIDTH - 64,
        y = VIRTUAL_HEIGHT - 64,
        width = 64,
        height = 64,
        cursorEnabled = true,
        items = {
            {
                text = 'Male',
                onSelect = function()
                    choosePlayerState.player = 'male_player'
                    choosePlayerState.openingText = "Welcome to the world of 50Mon Strong Man! "
                    gStateStack:pop()
                end
            },
            {
                text = 'Female',
                onSelect = function()
                    choosePlayerState.player = 'female_player'
                    choosePlayerState.openingText = "Welcome to the world of 50Mon Valiant Lady! "
                    gStateStack:pop()
                end
            },
            {
                text = 'Baby',
                onSelect = function()
                    choosePlayerState.player = 'baby_player'
                    choosePlayerState.openingText = "Welcome to the world of 50Mon Cute Baby! "
                    gStateStack:pop()
                end
            },
            {
                text = 'Skeleton',
                onSelect = function()
                    choosePlayerState.player = 'skeleton_player'
                    choosePlayerState.openingText = "Welcome to the world of 50Mon Scary Skeleton! "
                    gStateStack:pop()
                end
            }
        }
    }
end

function ChoosePlayerMenuState:update(dt)
    self.choosePlayerMenu:update(dt)
end

function ChoosePlayerMenuState:render()
    self.choosePlayerMenu:render()
end