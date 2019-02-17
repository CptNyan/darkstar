---------------------------------------------------------------------------------------------------
-- func: tale <teleport name>
-- desc: Removes experience points from the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

require("scripts/globals/keyitems")
require("scripts/globals/msg")



local tele_crystals = 
{
    ALTEPA  = {dsp.keyItem.ALTEPA_GATE_CRYSTAL, -61, 3, 224, 0, 114},
    DEM     = {dsp.keyItem.DEM_GATE_CRYSTAL, 220, 19, 300, 0, 108},
    HOLLA   = {dsp.keyItem.HOLLA_GATE_CRYSTAL, 420, 19, 20, 0, 102},
    MEA     = {dsp.keyItem.MEA_GATE_CRYSTAL, 100, 35, 340, 0, 117},
    VAHZL   = {dsp.keyItem.VAHZL_GATE_CRYSTAL, 150, -21, -37, 0, 112},
    YHOAT   = {dsp.keyItem.YHOATOR_GATE_CRYSTAL, -281, 0.5, -144, 0, 124}
}

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!tele <altepa|dem|holla|mea|vahzl|yhoat");
end;

function onTrigger(player, telePoint)
    local x = 0;
    local y = 0;
    local z = 0;
    local rot = 0;
    local zone;

    if (telePoint == nil) then
        error(player, "You must provide a teleport point.");
        return;
    end

    for k,v in pairs(tele_crystals) do
        if (k == string.upper(telePoint)) then
            local keyItem = v[1]
            if (player:hasKeyItem(keyItem)) then
                x       = v[2]
                y       = v[3]
                z       = v[4]
                rot     = v[5]
                zone    = v[6]
                break;
            else
                -- player doesn't have the gate crystal
                error(player,"You must have the corresponding gate crystal to teleport.");
                return;
            end
        end 
    end
    
    if (zone == nil) then
        -- telePoint is not in the table
        error(player, "Invalid teleport point provided.");
        return;
    end 


    -- send player
    player:setPos(x, y, z, rot, zone);
end;