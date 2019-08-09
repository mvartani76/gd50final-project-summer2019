--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayState = Class{__includes = BaseState}

function PlayState:init(player)
    self.level = Level { player = player}

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

    self.dialogueOpened = false
end

function PlayState:update(dt)
    if not self.dialogueOpened and love.keyboard.wasPressed('p') then
        if self.level.player.healingFlowers > 0 then
            -- heal player pokemon
            gSounds['heal']:play()
            self.level.player.party.pokemon[1].currentHP = self.level.player.party.pokemon[1].HP

            -- Subtract one of the healing flowers as it is being used
            self.level.player.healingFlowers = self.level.player.healingFlowers - 1

            -- show a dialogue for it, allowing us to do so again when closed
            gStateStack:push(DialogueState('Your Pokemon has been healed! You have ' .. tostring(self.level.player.healingFlowers) ..
                ' left for healing.', DEFAULT_DIALOGBOX_WIDTH, DEFAULT_DIALOGBOX_HEIGHT, 4,

            function()
                self.dialogueOpened = false
            end))
        else
            -- show a dialogue alerting the user that there are no healing flowers left
            gStateStack:push(DialogueState('You do not have any healing flowers to heal your Pokemon!', DEFAULT_DIALOGBOX_WIDTH, DEFAULT_DIALOGBOX_HEIGHT, 4,
        
            function()
                self.dialogueOpened = false
            end))
        end
    end
    if not self.dialgueOpened and love.keyboard.wasPressed('s') then
        gStateStack:push(DialogueState('Here are your stats:\n' ..
            'Level: ' .. tostring(self.level.player.playerLevel) .. '\n' ..
            'Experience: ' .. tostring(self.level.player.party.pokemon[1].currentExp) .. '\n' ..
            'Healing Flowers: ' .. tostring(self.level.player.healingFlowers), STATS_DIALOGBOX_WIDTH, DEFAULT_DIALOGBOX_HEIGHT, 4,
        
            function()
                self.dialogueOpened = false
            end))
    end

    self.level:update(dt)
end

function PlayState:render()
    self.level:render()
end