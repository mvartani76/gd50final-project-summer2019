--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

ENTITY_DEFS = {
    ['male_player'] = {
        animations = {
            ['walk-left'] = {
                frames = {16, 17, 18, 17},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-right'] = {
                frames = {28, 29, 30, 29},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-down'] = {
                frames = {4, 5, 6, 5},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-up'] = {
                frames = {40, 41, 42, 41},
                interval = 0.15,
                texture = 'entities'
            },
            ['idle-left'] = {
                frames = {17},
                texture = 'entities'
            },
            ['idle-right'] = {
                frames = {29},
                texture = 'entities'
            },
            ['idle-down'] = {
                frames = {5},
                texture = 'entities'
            },
            ['idle-up'] = {
                frames = {41},
                texture = 'entities'
            },
        }
    },
    ['female_player'] = {
        animations = {
            ['walk-left'] = {
                frames = {19, 20, 21, 20},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-right'] = {
                frames = {31, 32, 33, 32},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-down'] = {
                frames = {7, 8, 9, 8},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-up'] = {
                frames = {43, 44, 45, 44},
                interval = 0.15,
                texture = 'entities'
            },
            ['idle-left'] = {
                frames = {20},
                texture = 'entities'
            },
            ['idle-right'] = {
                frames = {32},
                texture = 'entities'
            },
            ['idle-down'] = {
                frames = {8},
                texture = 'entities'
            },
            ['idle-up'] = {
                frames = {44},
                texture = 'entities'
            },
        }
    },
    ['baby_player'] = {
        animations = {
            ['walk-left'] = {
                frames = {13, 14, 15, 14},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-right'] = {
                frames = {25, 26, 27, 26},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-down'] = {
                frames = {1, 2, 3, 2},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-up'] = {
                frames = {37, 38, 39, 38},
                interval = 0.15,
                texture = 'entities'
            },
            ['idle-left'] = {
                frames = {14},
                texture = 'entities'
            },
            ['idle-right'] = {
                frames = {26},
                texture = 'entities'
            },
            ['idle-down'] = {
                frames = {2},
                texture = 'entities'
            },
            ['idle-up'] = {
                frames = {38},
                texture = 'entities'
            },
        }
    },
    ['skeleton_player'] = {
        animations = {
            ['walk-left'] = {
                frames = {22, 23, 24, 23},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-right'] = {
                frames = {34, 35, 36, 35},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-down'] = {
                frames = {10, 11, 12, 11},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-up'] = {
                frames = {46, 47, 48, 47},
                interval = 0.15,
                texture = 'entities'
            },
            ['idle-left'] = {
                frames = {23},
                texture = 'entities'
            },
            ['idle-right'] = {
                frames = {35},
                texture = 'entities'
            },
            ['idle-down'] = {
                frames = {11},
                texture = 'entities'
            },
            ['idle-up'] = {
                frames = {47},
                texture = 'entities'
            },
        }
    },
    ['npc'] = {
        animations = {
            ['walk-left'] = {
                frames = {16, 17, 18, 17},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-right'] = {
                frames = {28, 29, 30, 29},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-down'] = {
                frames = {4, 5, 6, 5},
                interval = 0.15,
                texture = 'entities'
            },
            ['walk-up'] = {
                frames = {40, 41, 42, 41},
                interval = 0.15,
                texture = 'entities'
            },
            ['idle-left'] = {
                frames = {17},
                texture = 'entities'
            },
            ['idle-right'] = {
                frames = {29},
                texture = 'entities'
            },
            ['idle-down'] = {
                frames = {5},
                texture = 'entities'
            },
            ['idle-up'] = {
                frames = {41},
                texture = 'entities'
            },
        }
    }
}