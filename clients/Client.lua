LabormateClient = LabormateClient or {}

local clients = {}

function LabormateClient:Register(projectID, client)
    clients[projectID] = client
end

function LabormateClient:Select()
    local client = clients[WOW_PROJECT_ID]
    assert(client, "Labormate does not support this World of Warcraft client.")
    return client
end

function LabormateClient.GetProfessionAbilities(professionSkillIndex)
    local abilities = {}
    local _, _, _, _, numAbilities, spellOffset = GetProfessionInfo(professionSkillIndex)

    if not numAbilities or not spellOffset then
        return abilities
    end

    for i = 1, math.min(numAbilities, 2) do
        local spellInfo = C_SpellBook.GetSpellBookItemInfo(spellOffset + i, Enum.SpellBookSpellBank.Player)
        local spellID = spellInfo and spellInfo.actionID
        if spellID then
            abilities[#abilities + 1] = {
                spellID = spellID,
                buttonIndex = 3 - i,
            }
        end
    end

    return abilities
end

function LabormateClient.GetProfessionSkillLine(professionSkillIndex)
    return select(7, GetProfessionInfo(professionSkillIndex))
end
