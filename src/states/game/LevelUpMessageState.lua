--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

LevelUpMessageState = Class{__includes = BaseState}

function LevelUpMessageState:init(msg, onClose, canInput, x, y, width, height)
    self.textbox = Textbox(x, y, width, height, msg, gFonts['small'], 4)

    -- function to be called once this message is popped
    self.onClose = onClose or function() end

    -- whether we can detect input with this or not; true by default
    self.canInput = canInput

    -- default input to true if nothing was passed in
    if self.canInput == nil then self.canInput = true end
end

function LevelUpMessageState:update(dt)
    if self.canInput then
        self.textbox:update(dt)

        if self.textbox:isClosed() then
            gStateStack:pop()
            self.onClose()
        end
    end
end

function LevelUpMessageState:render()
    self.textbox:render()
end