local ForeverClient = {}

function ForeverClient:CanRefreshProfessionData()
    return false
end

function ForeverClient:GetAvailableExpansions()
    return {}
end

function ForeverClient:GetProfessionSlots()
    local profession1, profession2, profession3, profession4, profession5 = GetProfessions()
    local slots = {}
    slots[1] = profession1
    slots[2] = profession2
    slots[3] = profession3
    slots[4] = profession4
    slots[5] = profession5
    return slots
end

function ForeverClient:GetProfessionInfo(professionSkillIndex)
    local name, icon, skillLevel, maxSkillLevel, _, _, skillLine = GetProfessionInfo(professionSkillIndex)
    if not name then
        return nil
    end

    return {
        profession = skillLine,
        professionName = name,
        parentProfessionName = name,
        baseProfessionName = name,
        skillLevel = skillLevel,
        maxSkillLevel = maxSkillLevel,
        icon = icon,
    }
end

function ForeverClient:GetProfessionAbilities(professionSkillIndex)
    return LabormateClient.GetProfessionAbilities(professionSkillIndex)
end

function ForeverClient:RefreshProfessionData(_)
    -- Forever requires profession books to be opened through a secure spell action.
    return false
end

if WOW_PROJECT_CAMELOT then
    LabormateClient:Register(WOW_PROJECT_CAMELOT, ForeverClient)
end
