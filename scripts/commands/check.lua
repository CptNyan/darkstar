---------------------------------------------------------------------------------------------------
-- func: !check
-- desc: gets MODS by ID on the player or cursor target
--------------------------------------------------------------------------------------------------- 

cmdprops = { 
    permission = 3, 
    parameters = "i"
}; 

function onTrigger(player, id) -- validate target 
    local effectTarget = player:getCursorTarget(); 
    if (effectTarget == nil) then 
        effectTarget = player;
    end     
    
    player:PrintToPlayer(string.format("%s's HP: %i, MP: %i, Attack: %i, R-Attack %i, Defense: %i", 
            effectTarget:getName(), effectTarget:getHP(), effectTarget:getMP(), effectTarget:getStat(dsp.mod.ATT), 
            effectTarget:getMod(dsp.mod.RATT), effectTarget:getStat(dsp.mod.DEF)));

    player:PrintToPlayer(string.format("Acc: %i, RAcc: %i, Eva: %i", effectTarget:getACC(), 
            effectTarget:getRACC(), effectTarget:getEVA()));

    player:PrintToPlayer(string.format("STR: %i DEX %i VIT %i AGI %i INT %i MND %i CHR %i", 
        effectTarget:getStat(dsp.mod.STR), effectTarget:getStat(dsp.mod.DEX), effectTarget:getStat(dsp.mod.VIT), 
        effectTarget:getStat(dsp.mod.AGI), effectTarget:getStat(dsp.mod.INT), effectTarget:getStat(dsp.mod.MND),
        effectTarget:getStat(dsp.mod.CHR)));
        
    player:PrintToPlayer(string.format("MACC: %i, MATT: %i, MDEF %i", effectTarget:getMod(dsp.mod.MACC), 
        effectTarget:getMod(dsp.mod.MATT), effectTarget:getMod(dsp.mod.MDEF)));     
end;