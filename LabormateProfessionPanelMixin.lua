LabormateProfessionPanelMixin = LabormateProfessionPanelMixin or {}

function LabormateProfessionPanelMixin:UpdateFromSkillIndex(professionSkillIndex)
    local icon = "Interface/Icons/inv_misc_grouplooking"

    local info = nil
    self.badge:ClearAttributes()
    self.badge.professionName = nil
    self.badge.spellID1 = nil
    self.badge.spellID2 = nil

    if professionSkillIndex then
        local _, realIcon, _, _, numAbilities, spellOffset, skillLine = GetProfessionInfo(professionSkillIndex)
        icon = realIcon or icon

        if numAbilities and spellOffset then
            for i = 1, math.min(numAbilities, 2) do
                -- The journal is ability 1, and there may also be a profession ability.
                -- Put the journal on Right-Click and the profession ability on Left-Click.
                local buttonIndex = 3 - i
                local spellIndex = spellOffset + i
                local spellInfo = C_SpellBook.GetSpellBookItemInfo(spellIndex, Enum.SpellBookSpellBank.Player)
                local spellID = spellInfo and spellInfo.actionID

                if spellID then
                    self.badge["spellID" .. i] = spellID
                    self.badge:SetAttribute("type" .. buttonIndex, "spell")
                    self.badge:SetAttribute("spell" .. buttonIndex, spellID)
                end
            end
        end

        local skillLines = Labormate.SkillLineIds[skillLine]
        local skillLineID = skillLines and skillLines[LabormateDB.selectedExpansion]
        if skillLineID then
            info = C_TradeSkillUI.GetProfessionInfoBySkillLineID(skillLineID)
        end

        if info then
            if info.profession == Enum.Profession.Archaeology then
                self.badge.professionName = info.professionName
            else
                self.badge.professionName = info.parentProfessionName
            end
        end
    end

    self.statusBar:UpdateFromInfo(info)
    self.badge.icon:SetTexture(icon)
end

function LabormateProfessionPanelMixin:PlayStatusBarAnim()
    self.statusBar:PlayAnim()
end
