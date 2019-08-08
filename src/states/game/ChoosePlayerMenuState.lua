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
                    self.player = 'Male'
                    gStateStack:pop()
                    gSounds['intro-music']:stop()
                    gStateStack:push(PlayState('male_player'))
                    gStateStack:push(DialogueState("" .. 
                    "Welcome to the world of 50Mon Strong Man! To start fighting monsters," ..
                    " just walk in the tall grass! If you need to heal, just press 'P' in the field! " ..
                    "Good luck! (Press Enter to dismiss dialogues)"))
                    gStateStack:push(FadeOutState({
                        r = 255, g = 255, b = 255}, 1,
                        function() end))
                end
            },
            {
                text = 'Female',
                onSelect = function()
                    self.player = 'Female'
                    gStateStack:pop()
                    gSounds['intro-music']:stop()
                    gStateStack:push(PlayState('female_player'))
                    gStateStack:push(DialogueState("" .. 
                    "Welcome to the world of 50Mon Valiant Lady! To start fighting monsters," ..
                    " just walk in the tall grass! If you need to heal, just press 'P' in the field! " ..
                    "Good luck! (Press Enter to dismiss dialogues)"))
                    gStateStack:push(FadeOutState({
                        r = 255, g = 255, b = 255}, 1,
                        function() end))
                end
            },
            {
                text = 'Baby',
                onSelect = function()
                    self.player = 'Baby'
                    gStateStack:pop()
                    gSounds['intro-music']:stop()
                    gStateStack:push(PlayState('baby_player'))
                    gStateStack:push(DialogueState("" .. 
                    "Welcome to the world of 50Mon Cute Baby! To start fighting monsters," ..
                    " just walk in the tall grass! If you need to heal, just press 'P' in the field! " ..
                    "Good luck! (Press Enter to dismiss dialogues)"))
                    gStateStack:push(FadeOutState({
                        r = 255, g = 255, b = 255}, 1,
                        function() end))
                end
            },
            {
                text = 'Skeleton',
                onSelect = function()
                    self.player = 'Skeleton'
                    gStateStack:pop()
                    gSounds['intro-music']:stop()
                    gStateStack:push(PlayState('skeleton_player'))
                    gStateStack:push(DialogueState("" .. 
                    "Welcome to the world of 50Mon Scary Skeleton! To start fighting monsters," ..
                    " just walk in the tall grass! If you need to heal, just press 'P' in the field! " ..
                    "Good luck! (Press Enter to dismiss dialogues)"))
                    gStateStack:push(FadeOutState({
                        r = 255, g = 255, b = 255}, 1,
                        function() end))
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