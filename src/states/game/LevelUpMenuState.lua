--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

LevelUpMenuState = Class{__includes = BaseState}

function LevelUpMenuState:init(battleState)
    self.battleState = battleState
    
    self.battleMenu = Menu {
        x = VIRTUAL_WIDTH - LEVEL_UP_MENU_WIDTH,
        y = 16,
        width = LEVEL_UP_MENU_WIDTH,
        height = LEVEL_UP_MENU_HEIGHT,
        cursorEnabled = false,
        items = {
            {
                text = 'Fight',
                onSelect = function()
                    gStateStack:pop()
                end
            },
            {
                text = 'Run',
                onSelect = function()
                    gSounds['run']:play()
                    
                    -- pop battle menu
                    gStateStack:pop()

                    -- show a message saying they successfully ran, then fade in
                    -- and out back to the field automatically
                    gStateStack:push(BattleMessageState('You fled successfully!',
                        function() end), false)
                    Timer.after(0.5, function()
                        gStateStack:push(FadeInState({
                            r = 255, g = 255, b = 255
                        }, 1,
                        
                        -- pop message and battle state and add a fade to blend in the field
                        function()

                            -- resume field music
                            gSounds['field-music']:play()

                            -- pop message state
                            gStateStack:pop()

                            -- pop battle state
                            gStateStack:pop()

                            gStateStack:push(FadeOutState({
                                r = 255, g = 255, b = 255
                            }, 1, function()
                                -- do nothing after fade out ends
                            end))
                        end))
                    end)
                end
            }
        }
    }
end

function LevelUpMenuState:update(dt)
    self.battleMenu:update(dt)
end

function LevelUpMenuState:render()
    self.battleMenu:render()
end