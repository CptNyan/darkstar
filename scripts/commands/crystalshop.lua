--------------------------------------------------------------
-- func: @crystalshop
-- auth: CptNyan
-- desc: opens a custom crystal shop anywhere in the world
--------------------------------------------------------------

require("scripts/globals/shop")

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player, page)
    local stock =
    {
        4096,   225,        -- fire crystal
        4097,   225,        -- ice crystal
        4098,   225,        -- wind crystal
        4099,   225,        -- earth crystal
        4100,   225,        -- lightning crystal
        4101,   225,        -- water crystal
        4102,   225,        -- light crystal
        4103,   225,        -- dark crystal
        4104,   2000,       -- fire cluster
        4105,   2000,       -- ice cluster
        4106,   2000,       -- wind cluster
        4107,   2000,       -- earth cluster
        4108,   2000,       -- lightning cluster
        4109,   2000,       -- water cluster
        4110,   2000,       -- light cluster
        4111,   2000,       -- dark cluster
        4238,   5000,       -- HQ Fire Crystal
        4239,   5000,       -- HQ Ice Crystal
        4240,   5000,       -- HQ Wind Crystal
        4241,   5000,       -- HQ Earth Crystal
        4242,   5000,       -- HQ Lightning Crystal
        4243,   5000,       -- HQ Water Crystal
        4244,   5000,       -- HQ Light Crystal
        4245,   5000        -- HQ Dark Crystal
    };
    dsp.shop.general(player,stock)
end;