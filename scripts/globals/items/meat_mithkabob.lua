-----------------------------------------
-- ID: 4381
-- Item: meat_mithkabob
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 5
-- Agility 1
-- Intelligence -2
-- Attack % 22
-- Attack Cap 60
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4381);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 60);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 60);
end;
