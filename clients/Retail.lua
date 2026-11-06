local RetailClient = {}

function RetailClient:CanRefreshProfessionData()
    return true
end

function RetailClient:GetAvailableExpansions()
    local expansions = {}
    for expansion = LE_EXPANSION_CLASSIC, LE_EXPANSION_LEVEL_CURRENT do
        local name = _G["EXPANSION_NAME" .. expansion]
        if name then
            expansions[#expansions + 1] = { id = expansion, name = name }
        end
    end
    return expansions
end

function RetailClient:GetProfessionSlots()
    local profession1, profession2, archaeology, fishing, cooking = GetProfessions()
    return { profession1, profession2, cooking, fishing, archaeology }
end

function RetailClient:GetProfessionInfo(professionSkillIndex, expansion)
    local skillLine = LabormateClient.GetProfessionSkillLine(professionSkillIndex)
    local skillLines = Labormate.SkillLineIds[skillLine]
    local expansionSkillLine = skillLines and skillLines[expansion]
    if expansionSkillLine then
        return C_TradeSkillUI.GetProfessionInfoBySkillLineID(expansionSkillLine)
    end
end

function RetailClient:GetProfessionAbilities(professionSkillIndex)
    return LabormateClient.GetProfessionAbilities(professionSkillIndex)
end

function RetailClient:RefreshProfessionData(professionSkillIndex)
    local skillLine = LabormateClient.GetProfessionSkillLine(professionSkillIndex)
    if not skillLine then
        return false
    end

    local success = C_TradeSkillUI.OpenTradeSkill(skillLine)
    if success then
        C_TradeSkillUI.CloseTradeSkill()
    end
    return success
end

LabormateClient:Register(WOW_PROJECT_MAINLINE, RetailClient)
