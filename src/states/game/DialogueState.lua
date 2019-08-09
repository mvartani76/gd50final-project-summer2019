--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

DialogueState = Class{__includes = BaseState}

function DialogueState:init(text, width, height, numRows, callback)
    self.height = height or DEFAULT_DAILOGBOX_HEIGHT
    self.width = width or DEFAULT_DIALOGBOX_WIDTH
    self.numRows = numRows or 4
    self.textbox = Textbox(6, 6, self.width, self.height, text, gFonts['small'], numRows)
    self.callback = callback or function() end
end

function DialogueState:update(dt)
    self.textbox:update(dt)

    if self.textbox:isClosed() then
        self.callback()
        gStateStack:pop()
    end
end

function DialogueState:render()
    self.textbox:render()
end