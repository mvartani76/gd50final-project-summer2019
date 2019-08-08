--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Player = Class{__includes = Entity}

function Player:init(def)
    Entity.init(self, def)
    -- randomly start out the player level between 4 and 7
    self.playerLevel = math.random(4, 7)
    self.party = Party {
        pokemon = {
            Pokemon(Pokemon.getRandomDef(), self.playerLevel)
        }
    }
end