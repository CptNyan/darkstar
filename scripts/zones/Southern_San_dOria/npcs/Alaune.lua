-----------------------------------
-- Area: Southern San d`Oria
--   NPC: Alaune
-- Type: Tutorial NPC
-- !pos -90 1 -56 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/conquest");
require("scripts/globals/common");
require("scripts/globals/weaponskills");
require("scripts/globals/status");
-----------------------------------

-- Tutorial NPC Quest: https://ffxiclopedia.fandom.com/wiki/Tutorial_NPC#San_d.27Oria
--[[
Stage: 0
    CS915 - Initial introduction 

Stage: 1
    CS916 - "so you're interested in entry level duties"
    CS917 - Directed to get signet

Stage: 2
    CS918 - Post signet:
            - receive 6 strips meat jerky
            - directed to eat the jerky
    CS919 - Directed to eat a meal, then come back to Aluane with Food status

Stage: 3
    CS920 - Explanation of weaponskill
    CS921 - Send off to use a weaponskill
    CS922 - Learned weaponskill
            - receive slice of hare meat
            - receive fire crystal
            - receive chunk of rock salt

Stage: 4
    CS923 - Go use AH
    CS924 - wtg, you found AH
    CS925 - Explanation of XP bands. Sent to make it to level 4
    CS926 - Explanation of XP loss
            - receive Raising Earring

Stage: 5
    CS927 - Go to La Theine Plateau to kill a mob
    CS928 - You came back!
            - receive 800 XP

Stage: 6
    CS929 - Go get level 10
    CS930 - You got level 10
            - receive 1000 gil

Stage: 7
    CS931 - Go get Holla gate crystal (key item)
    CS932 - You got the crystal, huzzah
            - receive 1000 XP
            - receive 3 chocopasses
--]]

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)
    -- Tutorial NPC Quest vars
    TutorialStatus = player:getVar('TutorialStatus');
    LTPMobKill     = player:getVar('LTPMobKill');
    WeapSkillType  = player:getWeaponSkillType(dsp.slot.MAIN);
    WeapSkillLvl   = player:getCharSkillLevel(WeapSkillType);
    Nation         = player:getNation();
    CharLevel      = player:getMainLvl();
    if Nation == 0 then -- Allied with San d'Oria
        if ((TutorialStatus == 0) and (CharLevel <= 10)) then -- Stage: 0
            player:startEvent(915); 
        elseif (TutorialStatus == 915) then -- Stage: 1
            player:startEvent(916);
        elseif ((TutorialStatus == 917) and (player:hasStatusEffect(dsp.effect.SIGNET))) then -- Stage: 2
            player:startEvent(918);
        elseif ((TutorialStatus == 919) and (player:hasStatusEffect(dsp.effect.FOOD))) then -- Stage: 3
            player:startEvent(920);
        end
    else
        player:startEvent(933);
    end
end;

function onEventUpdate(player,csid,option)
    player:PrintToPlayer(string.format("CSID: %u",csid));
    player:PrintToPlayer(string.format("RESULT: %u",option));
end;

function onEventFinish(player,csid,option)
    player:setVar("TutorialStatus", csid)   -- TutorialStatus stages will map to the cutscene IDs
    
    if (csid == 918) then
        if (player:getFreeSlotsCount() > 0) then
            player:addItem(4376, 6);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4376);
            player:setVar("TutorialStatus", 3);
        else
            player.messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED );
        end
    elseif (csid == 922) then
        if (player:getFreeSlotsCount() > 2) then
            player:addItem(926);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 926);

            player:addItem(4370);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4370);

            player:addItem(4096);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4096);
        else
            player.messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED );
        end
    end
end;