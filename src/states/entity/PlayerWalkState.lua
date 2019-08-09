--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerWalkState = Class{__includes = EntityWalkState}

function PlayerWalkState:init(entity, level)
    EntityWalkState.init(self, entity, level)
    self.encounterFound = false
end

function PlayerWalkState:enter()
    self:checkForEncounter()

    -- Check to see if the player has run into any items
    self:checkForItem()

    if not self.encounterFound then
        self:attemptMove()
    end
end

function PlayerWalkState:checkForEncounter()
    local x, y = self.entity.mapX, self.entity.mapY

    -- chance to go to battle if we're walking into a grass tile, else move as normal
    if self.level.grassLayer.tiles[y][x].id == TILE_IDS['tall-grass'] and math.random(10) == 1 then
        self.entity:changeState('idle')

        -- trigger music changes
        gSounds['field-music']:pause()
        gSounds['battle-music']:play()
        
        -- first, push a fade in; when that's done, push a battle state and a fade
        -- out, which will fall back to the battle state once it pushes itself off
        gStateStack:push(
            FadeInState({
                r = 255, g = 255, b = 255,
            }, 1, 
            
            -- callback that will execute once the fade in is complete
            function()
                gStateStack:push(BattleState(self.entity))
                gStateStack:push(FadeOutState({
                    r = 255, g = 255, b = 255,
                }, 1,
            
                function()
                    -- nothing to do or push here once the fade out is done
                end))
            end)
        )

        self.encounterFound = true
    else
        self.encounterFound = false
    end
end

-- Method to check and see if the player has run into any items
-- If the player has, convert the tile back to tall-grass, play a powerup sound, and give the player some exp
function PlayerWalkState:checkForItem()
    local x, y = self.entity.mapX, self.entity.mapY

    if self.level.grassLayer.tiles[y][x].id == TILE_IDS['tall-grass-flower'] then

        self.level.grassLayer.tiles[y][x].id = TILE_IDS['tall-grass']

        gSounds['powerup']:play()

        -- add exp points based on the player level
        self.entity.party.pokemon[1].currentExp = self.entity.party.pokemon[1].currentExp + math.random(self.entity.playerLevel*2,self.entity.playerLevel*3)

        -- level up if we've gone over the needed amount
        if self.entity.party.pokemon[1].currentExp > self.entity.party.pokemon[1].expToLevel then
            gSounds['levelup']:play()

            -- set our exp to whatever the overlap is
            self.entity.party.pokemon[1].currentExp = self.entity.party.pokemon[1].currentExp - self.entity.party.pokemon[1].expToLevel
            self.entity.party.pokemon[1]:levelUp()
        end

        self.itemFound = true
    else
        self.itemFound = false
    end
end